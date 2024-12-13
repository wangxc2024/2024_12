function [AutoC,a,b,sa,yy]=getautocorr(param,pulse,Ns,xfix,mp)

Tp=80;
ut=param.ut;
T=Tp/ut;
Tt=40/ut;
Tr=0.4/ut;
yy=zeros(90,T);

for k=1:size(xfix,2)     %随机撒点
ac=zeros(1,3);
    for s=1:Ns
%     yy(:,1)=xfix(:,k);
    yy=getatracedwm_mex(1,xfix(:,k),param,pulse);
    yy=getatracedwm_mex(Tp,yy(:,1/ut),param,pulse);
    
    pc1=mp(:,1)'*yy;
    pc2=mp(:,2)'*yy;
%     pc1=yy(1,:);
 
    [a,b]=xcorr(pc1,pc1(1:Tt));
    
%     [c,d]=xcorr(pc2,pc1(1:Tt));
    sa=floor(size(a,2)/2);
    A=a(sa)/Tt-mean(pc1(1:Tt))^2;
    ac(1,1)=max(abs(-(a(1,sa+2020)-a(1,sa+20))^(-1)*Tt*2000*ut*A),ac(1,1));
    ac(1,2)=max(abs(-(a(1,sa+1020)-a(1,sa+20))^(-1)*Tt*1000*ut*A),ac(1,2));
    ac(1,3)=max(abs(-(a(1,sa+120)-a(1,sa+20))^(-1)*Tt*100*ut*A),ac(1,3));
    end
    AutoC(k,:)=ac(1,:);

end
  

end



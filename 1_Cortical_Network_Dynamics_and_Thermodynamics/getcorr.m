function [CC,AutoC,stdCC,stdAutoC,CCdv,a1,b,c,d,p,q,A,p0,sa,pc10,pc20,cfun]=getcorr(param,pulse,Ns,xfix,mp,noise)

Tp=512;
ut=param.ut;
T=Tp/ut;
Tt=412/ut;
Tr=1/ut;
yy=zeros(90,T);
Tu=128;
for k=1:size(xfix,2)     %随机撒点
cc=zeros(1,Ns);
% ac=zeros(1,3);
tao=zeros(1,Ns);
    for s=1:Ns
    pc1=zeros(1,Tp/ut);
    pc2=zeros(1,Tp/ut);
    ppc1=zeros(1,Tp/ut);
    ppc2=zeros(1,Tp/ut);
    pr1=zeros(1,Tp/ut);
    pr2=zeros(1,Tp/ut);
%     yy(:,1)=xfix(:,k);
    yy=getatracedwmnoise_mex(1,xfix(:,k),param,pulse,noise);
    yp=getatracedwmnoise_mex(1,yy(:,1/ut),param,pulse,noise);
%     pc1=mp(:,1)'*yy;
%     pc2=mp(:,2)'*yy;
    if abs(mp(:,1)'*yp(:,1/ut)-mp(:,1)'*yy(:,1))>0.6
        '已转移'
        pulse
        yy=getatracedwmnoise_mex(10,yp(:,1/ut),param,pulse,noise);
        yp=getatracedwmnoise_mex(1,yy(:,1/ut),param,pulse,noise);
    end
    Tl=0;
    Tq=0;
    yr=yp(:,1/ut);
    yr0=yr;
    i=1;
    xxp=0;
    while Tl+Tq<Tp  
    yy=getatracedwmnoise_mex(Tu,yr,param,pulse,noise);

    if abs(mp(:,1)'*yy(:,Tu/ut)-mp(:,1)'*yr0)>0.6

        Tl;
        Tu=max(Tu/2,1);
        Tl=Tl+Tq;
        Tq=0;

        i=i+1;
        xxp=0;
        yr=yp(:,randi([1,1/ut],1,1));
        if i>500
            xp=0;
            yy=getatracedwmnoise_mex(10,yr,param,pulse,noise);
            yy=getatracedwmnoise_mex(Tp/2,yy(:,10/ut),param,pulse,noise);
            pc1(1:Tp/2/ut)=mp(:,1)'*yy;
            pc2(1:Tp/2/ut)=mp(:,2)'*yy;
            pc1(Tp/2/ut+1:Tp/ut)=0;
            pc2(Tp/2/ut+1:Tp/ut)=0;
            pr1(1:Tp/2/ut)=1;
            pr2(1:Tp/2/ut)=1;
            pr1(Tp/2/ut+1:Tp/ut)=0;
            pr2(Tp/2/ut+1:Tp/ut)=0;
            '已转移了'
            pulse
            break
            
        end
    else
        pc1(Tl/ut+1:(Tl+Tu)/ut)=mp(:,1)'*yy;
        pc2(Tl/ut+1:(Tl+Tu)/ut)=mp(:,2)'*yy;
        pr1(Tl/ut+1:(Tl+Tu)/ut)=1;
        pr2(Tl/ut+1:(Tl+Tu)/ut)=1;
        Tl=Tl+Tu;
        yr=yy(:,Tu/ut);
        xxp=xxp+Tu;
        xp(i)=xxp;
        Tq=Tq+Tu;
        
    end 
    
    end 
        
    Ts=32;
    for s=xp
        if s ~=0
            Ts=min(s,Ts);
        end
    end
    Ts;
    
    
    
    fpc1=find(pc1);
    fpc2=find(pc2);
    p0=mean(pc1(fpc1));% xcorr(1 0 )
    p20=mean(pc2(fpc2));
    s1=std(pc1(fpc1));
    s2=std(pc2(fpc2));
    ppc1(fpc1)=pc1(fpc1)-p0;
    ppc2(fpc2)=pc2(fpc2)-p20;
    pc10=pc1(fpc1);
    pc20=pc2(fpc2);
    
    
    [aa1,b]=xcorr(ppc1,(ppc2(1:Tt)));
    [cc1,d]=xcorr(ppc2,(ppc1(1:Tt)));
    [ar1,~]=xcorr(pr1,(pr2(1:Tt)));
    [cr,~]=xcorr(pr2,(pr1(1:Tt)));
    a1=aa1./ar1;
    c=cc1./cr;

    sa=floor(size(a1,2)/2)+1;
    cc(s)=mean(trapz((a1(sa:sa+Tr)-c(sa:sa+Tr)).^2/Tt/Tt/(Tr))^(1/2));
    ccdv(s)=mean(trapz((a1(sa:sa+Tr)/s1/s2-c(sa:sa+Tr)/s1/s2).^2/Tt/Tt/(Tr))^(1/2));
    
    
    [pp,q]=xcorr(ppc1,(ppc1(1:Tt)));
    [pr,~]=xcorr(pr1,(pr1(1:Tt)));
    p=pp./pr;
    
%     [c,d]=xcorr(pc2,pc1(1:Tt));
%  Ts=1;  
    x=[0:ut:0.9*Ts]';%列向量
    y=p(sa+1:sa+1+0.9*Ts/ut)';
    f=fittype('a*exp(-w*t)+b','independent','t','coefficients',{'a','w','b'});  %fittype是自定义拟合函数
    opt=fitoptions(f);
    opt.StartPoint=[p(sa+1) 1 p(sa+1)/100];
    cfun=fit(x,y,f,opt); %根据自定义拟合函数f来拟合数据x，y
    
    xi=x;
    yi=cfun(xi);
    plot(x,y,xi,yi);
%     cfun.w^-1
    tao(s)=cfun.w^-1;
    A=[p(sa+1) cfun.a];
%     ac(1,1)=max(abs(-(p(1,sa+2020)-p(1,sa+20))^(-1)*Tt*2000*ut*A),ac(1,1));
%     ac(1,2)=max(abs(-(p(1,sa+1020)-p(1,sa+20))^(-1)*Tt*1000*ut*A),ac(1,2));
%     ac(1,3)=max(abs(-(p(1,sa+120)-p(1,sa+20))^(-1)*Tt*100*ut*A),ac(1,3));
    end
    CC(k)=mean(cc);
    CCdv(k)=mean(ccdv);
    AutoC(k,:)=mean(tao);
    stdCC(k)=std(cc);
    stdAutoC(k,:)=std(tao);

end
  

end



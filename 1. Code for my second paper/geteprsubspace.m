function [EPR,Jav]=geteprsubspace(param,pulse,Ns,xfix,mp)
Nmp=size(mp,2);
Tp=1;
ut=param.ut;
T=Tp/ut;
EPR=zeros(size(xfix,2),Nmp);
Jav=zeros(size(xfix,2),Nmp);
for k=1:size(xfix,2)     %随机撒点
epr=zeros(1,Nmp);
jav=zeros(1,Nmp);
D=diffusion(xfix(:,k),param);
    for s=1:Ns
        for i=1:Nmp
        [yy,uy]=getatracedwm_mex(Tp,xfix(:,k),param,pulse);
        upc=mp{1,i}'*uy;
        Dpc=mp{1,i}'*D*mp{1,i};
        epr(1,i)=sum(trapz(upc'.^2))/T/Ns+epr(1,i);
        jav(1,i)=(sum(trapz(upc'.^2))/T)^0.5/Ns+jav(1,i);
        epr(1,i)=(sum(trapz(upc'*Dpc^(-1).*upc'))/T)/Ns+epr(1,i);
        end

    end
    Jav(k,:)=jav;
    EPR(k,:)=epr;

end
  

end



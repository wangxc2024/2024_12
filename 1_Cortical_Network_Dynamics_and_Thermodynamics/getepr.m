function [EPR,Jav]=getepr(param,pulse,Ns,xfix,mp)

Tp=1;
ut=param.ut;
T=Tp/ut;
EPR=zeros(1,size(xfix,2));
Jav=zeros(1,size(xfix,2));
for k=1:size(xfix,2)     %随机撒点
epr=0;
jav=0;
D=diffusion(xfix(:,k),param);
    for s=1:Ns
    
    [yy,uy]=getatracedwm_mex(Tp,xfix(:,k),param,pulse);
    jav=(sum(trapz(uy'.^2))/T)^0.5/Ns+jav;
    epr=(sum(trapz(uy'*D^(-1).*uy'))/T)/Ns+epr;
    

    end
    Jav(k)=jav;
    EPR(k)=epr;

end
  

end



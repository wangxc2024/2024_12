function [y]=phi(mu,sig,tref,tm,tampa,Vth,Vr,Vl)
    a=(Vr-mu-Vl)./sig.*(1+0.5*tampa/tm)+1.03*(tampa/tm)^0.5-0.5*tampa/tm;
    b=(Vth-mu-Vl)./sig;
    x=a:0.0001:b;
    intg=exp(x.^2).*(1+erf(x))*0.0001;
    y=(tref+tm*(pi^0.5)*trapz(intg)).^-1/1;
end
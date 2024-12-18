function dSom=dSOM(x_1,x,x1,Fx,Fx_1,dFx,Gn,param,D,h)

dSom =  (Gn)^-1*(2*x-x1-x_1)/2/D/h ...
        +h/2/D*(Gn)^-1*dFx*Fx ...
        +1/2/D*(Gn)^-1*dFx*(x-x1) ...
        +1/2/D*(Gn)^-1*(Fx-Fx_1);
end
function [p]=showinpca(yend,mp) 
    Ns=size(yend,2);
    pc1=mp(:,1)'*yend;
    pc2=mp(:,2)'*yend;

    Nx=10;
    Ny=10;
    xl=floor(min(pc1))-1;
    xr=floor(max(pc1))+1;
    yd=floor(min(pc2))-1;
    yu=floor(max(pc2))+1;
    X1=linspace(xl,xr,(Nx)*(xr-xl));
    Y1=linspace(yd,yu,(Ny)*(yu-yd));
    [X,Y] = meshgrid(X1,Y1);
    p=zeros(Nx*(xr-xl),Ny*(yu-yd));
    ss=reshape([pc1 pc2],[],2);
    yN=floor([Nx,Ny].*ss);

    for k=1:Ns
        

        p((yN(k,1)-xl*Nx),(yN(k,2)-yd*Ny))=p(yN(k,1)-xl*Nx,yN(k,2)-yd*Ny)+1;

    end    

surf(X,Y,-log(p+1)')
shading interp;
end

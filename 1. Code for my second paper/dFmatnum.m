function A=dFmatnum(t,x,param)
A=zeros(90);
F=odeDWM(t,x,param);
for i=1:90
    x1=x;
    x1(i)=x1(i)+0.00001;
    F1=odeDWM(t,x1,param);
    for j=1:90
        
        A(i,j)=(F1(j)-F(j))/0.00001;
    end
end

end

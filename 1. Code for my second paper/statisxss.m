function [xfix,weight]=statisxss(x)
    xfix=x(:,1);
    xfix(:,1)=x(:,1);
    weight(1)=1;
    D=1;
    for i=2:size(x,2)
        wh=0;
        for d=1:D
            if sum((x(:,i)-xfix(:,d)).^2)<0.1
                weight(d)=weight(d)+1;
                wh=1;
            end
        end
        if wh==0
            xfix(:,D+1)=x(:,i);
            weight(D+1)=1;
            D=D+1;
        end
        
    end
end
        


            
    
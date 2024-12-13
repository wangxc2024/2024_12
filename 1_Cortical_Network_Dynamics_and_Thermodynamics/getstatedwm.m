function [xm1,xm2,xr,nstates,weight]=getstatedwm(Jm,G,pulse)


param=paramJm_G(Jm,G,0.001);
%         
%         ip+b-1

                        
                        xss=randomxss(param,pulse,1000,0,1000);
                
                        [xfix,weight]=statisxss(xss);
                        for iw=1:size(weight,2)
                        if weight(iw)<10
                            xfix(:,iw)=0;
                            weight(1,iw)=0;
                        end
                        end
                        wy=find(weight);
                        xfix=xfix(:,wy);
                        weight=weight(wy);
                            

                        
                        [x24cm1,im1]=max(xfix(30,:));
                        xm1=xfix(:,im1);
                        [x24cm2,im2]=max(xfix(60,:));
                        xm2=xfix(:,im2);
                        [x24cr,ir]=min(xfix(30,:)+xfix(60,:));
                        xr=xfix(:,ir);
                        
                        nstates=size(xfix,2);
                        
end
                        
                        
                        
                        
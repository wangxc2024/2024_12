
param=paramJm_G(0.27,0.51,0.001);
pulse=zeros(30,3);

                        xss=randomxss(param,pulse,1000,1,1000);
                
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
                            
%                         C{b,bg}={[xfix],[weight]};
                        
                        
                %     %     [mp,sc,va]=pca(xss');
                    % % 
                    %     save('pca0.mat','mp')
                        
                %         showinpca(xss,mp);
                %          A_matrix=getmatrix(xfix,param);
                    %     Dss=A_matrix*0;
                %         d=0.05;
                %         for i=1:size(xfix,2)
                % 
                %             Dss{i}=getsigma(d,A_matrix{i});
                % 
                %         end
                %         xfix=C{ip,b,1};
                %         weight=C{ip,b,2};
                
                
                %         xfix=C{ip,b}{1,1};
                %         weight=C{ip,b}{1,2};
                        A_matrix=cell(1,size(xfix,2));
                        param.Iinput=pulse;
                %         A_matrix=getmatrix(xfix,param);
                        for ia=1:size(xfix,2)
                        A_matrix{ia}=dFmatnum(1,xfix(:,ia),param);
                        end
                                                          
                        parfor in=1:10
                            for sn=1:11
                                Inoise=exp(in-3);
                                Snoise=exp(sn-3);
                                [EPR,JAV]=geteprSim(param,pulse,Inoise,Snoise,xfix,A_matrix);
                                Epr(in,sn)=sum(EPR.*weight)/sum(weight);
                                Jav(in,sn)=sum(JAV.*weight)/sum(weight);
                        
                            end
                        end
                        [X,Y] = meshgrid(1:10,1:11);
Fig = surf(X,Y,real(Epr')); %绘制三维曲面图
    shading interp;
hold on
                        
                        
                        
                        
                        
                        
                        
                        
                        




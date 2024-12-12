






clear;

sV1=0;
Np=size(sV1,2);

% Jm=[0.21:0.04:0.56];
Jm=0.243;
Nj=size(Jm,2);
% G=[0.21:0.04:0.6];
G=[0.46:0.02:0.8];

Ng=size(G,2);

ut=0.002;  
Ns=1;
load('pca0.mat')
Amat=cell(Nj,Ng);
% load('AmatJm0.3versussV1.mat', 'Amat')
% 检查是否已经安装 Parallel Computing Toolbox
% if ~matlab.internal.parallel.isPCTInstalled
%     error('Parallel Computing Toolbox 未安装或未启用。');
% end
% 
% % 检查是否已经启动了并行池，如果没有，则创建一个新的
% if isempty(gcp('nocreate'))
%     % 如果你有多个处理器核心，可以指定希望使用的工作进程数量（workers）
%     numWorkers = 4; % 你可以根据自己的系统配置进行调整
%     parpool('local', numWorkers);
% end

for ip=1:Np
    pulse=zeros(30,3);
    pulse(1,1)=sV1(ip); %activation
    
    
%     pulse(16:17,3,1)=sV1(ip);       %inactivation
%     pulse(27:28,3,1)=sV1(ip);
     for bg=1:Ng
%         param=paramJm_G(Jm(b),0.3,ut);
        for b=1:Nj
        param=paramJm_G(Jm(b),G(bg),ut);
%         
%         ip+b-1

                        
                        xss=randomxss(param,pulse,100,1,1000);
                
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
                            
                        C{b,bg}={[xfix],[weight]};
                        
                        [x24cm,im]=max(xfix(30,:))
                        xm=xfix(:,im);
                        [x24cr,ir]=min(xfix(30,:)+xfix(60,:))
                        xr=xfix(:,ir);
                        
                
noise=1;
noiseadd=0;
for iy=1:100
    y0= iy*xm/100+(100-iy)*xr/100;

yy=getatracedwmnoise(30,y0,param,pulse,noise,noiseadd);

if sum((yy(:,30/ut-10)-xm).^2)>sum((yy(:,30/ut-10)-xr).^2)
    saddle(:,bg)=y0;
    rsd(1,bg)=sum((y0-xm).^2)^0.5;

    param.Iinput=pulse;

    A_matrix=getmatrixnum(xfix,param);
    Dss = [];

    
    for i=1:size(xfix,2)
        if isreal(A_matrix{i})
            d=0.01*diffu(xfix(:,i),param,1,1);
        
            Dss{i}=getsigma(d,A_matrix{i});
        else
            d=diffu(xfix(:,i),param,1,1);
            i
            Dss{i}=getsigma(d,real(A_matrix{i}));
        end
        
    end
% %     
    Py0=getPx(y0,xfix,Dss,weight,mp);
    Pm=getPx(xm,xfix,Dss,weight,mp);
    Psaddle(1,bg)=Py0;
%     
    
    break
end
end

                        [b,bg]
        
% mt=zeros(1,100);
% nt=0
% for im=1:100
% [mfpt,w,~,~,~]=mfptdwm(Jm(b),G(bg),6,0,3,1,mp);
% mt(im)=mfpt;
% nt=nt+w;
% end
% 
% Mfptr2m(b,bg)=sum(sum(mt))/nt;
% 
% mt=zeros(1,100);
% nt=0
% for im=1:100
% [mfpt,w,~,~,~]=mfptdwm(Jm(b),G(bg),6,1,0,1,mp);
% mt(im)=mfpt;
% nt=nt+w;
% end
% 
% Mfptm2r(b,bg)=sum(sum(mt))/nt;


    %     [X,Y,Pz]=getPss(xfix,Dss,weight,mp);



    %     Uz = -log(Pz);                      %landscape U
    % 
    %     %绘制曲面
    %     Fig = surf(X,Y,Uz); %绘制三维曲面图
    %     shading interp;
        end
    end

end

plot(G,Psaddle)
plot(G,rsd)




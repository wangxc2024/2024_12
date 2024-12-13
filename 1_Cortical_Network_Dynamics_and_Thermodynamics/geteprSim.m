function [EPR,Jav]=geteprSim(param,pulse,Inoise,Snoise,xfix,A_matrix)
param.Iinput=pulse;
Tp=1;
ut=param.ut;
T=Tp/ut;
EPR=zeros(1,size(xfix,2));
Jav=zeros(1,size(xfix,2));
for k=1:size(xfix,2)     %随机撒点
    epr=0;
    jav=0;
    D=diffu(xfix(:,k),param,Inoise,Snoise);
    N=divD(xfix(:,k),param,Inoise);
    N2=0.*N;
    A=A_matrix{1,k};% dFj/dxi,(i,j)
    Sig=getsigma(D,A);
    Sigd=Sig^-1;
    M=A+D/Sig;
    
    detsig=det(Sig);
    
    M2=A;%这里为什么会出现M2，N2呢，应该是试探完忘改回来了
    S1=zeros(1,90);
    S2=zeros(90,90);
%     for a=1:90
%         AA2=Sigd(a,a);
% %         S1(a)=M(:,a)'*D^(-1)*M(:,a)*sqrt(pi)/(2*Sigd(a,a)^(3/2));  % 未归一化
%         S1(a)=M(:,a)'*D^(-1)*M(:,a)*  sqrt(2*pi)/(AA2^(3/2))  /   sqrt((2*pi)/AA2);
%         bb=1:90;
%         bb(a)=[];
%         for b=bb
%             
%             CC2=Sigd(a,b)+Sigd(b,a);
%             
%             BB2=Sigd(b,b);
% 
% %             S2(a,b)=-(M(:,a)'*D^-1*M(:,b))*((8*CC2*pi)/(4*AA2*BB2 - CC2^2)^(3/2))/sqrt((2*pi)^90*detsig);
%             S2(a,b)=-(M(:,a)'*D^-1*M(:,b))  *  ((8*CC2*pi)/(4*AA2*BB2 - CC2^2)^(3/2))  /  (4*pi/sqrt(4*AA2*BB2-CC2^2));
% 
%         end
%     end


Sm=trace(M'*D^-1*M*Sig);

    S3=N'*D^-1*N;
%     epr=sum(S1)+sum(sum(S2))+S3;
epr=Sm+S3;
    
    D=eye(90);
%     for a=1:90
%         
%         SP2=1/(sqrt((4*pi)^90*detsig));
%         SEa2=sqrt(pi/Sigd(a,a));
%         Sx2Ea2=sqrt(pi)/(2*Sigd(a,a)^(3/2));
% %         S1(a)=M(:,a)'*D^(-1)*M(:,a)*sqrt(pi)/(2*Sigd(a,a)^(3/2));
% %         S1(a)=M(:,a)'*D^(-1)*M(:,a)*sqrt(2*pi)/(Sigd(a,a)^(3/2))/sqrt((2*pi)^90*detsig);
% %           S1(a)=M(:,a)'*D^(-1)*M(:,a)*sqrt(2*pi)/(Sigd(a,a)^(3/2))/sqrt((2*pi)^90*detsig);
%         S1(a)=M(:,a)'*D^(-1)*M(:,a)*  Sx2Ea2  *  SP2  /  SEa2;
%         bb=1:90;
%         bb(a)=[];
%         for b=bb
% 
% %             S2(a,b)=-(2*M(:,a)'*D^-1*M(:,b))*((Sigd(a,b)*pi)/(2*Sigd(b,b)^(3/2)*(Sigd(a,a) - Sigd(a,b)^2/Sigd(b,b))^(3/2)));
%             S2(a,b)=-(2*M(:,a)'*D^-1*M(:,b))*((2*Sigd(a,b)*pi)/(Sigd(b,b)^(3/2)*(Sigd(a,a) - Sigd(a,b)^2/Sigd(b,b))^(3/2)))/sqrt((2*pi)^90*detsig);
% 
% 
%         end
%     end
    
    Smm=0.5^91*sqrt(det(Sigd)/pi^90)*trace(M'*M*Sig);
    S3=N'*D^-1*N;
    
    
%     jav=(sum(S1)+sum(sum(S2))+S3)^0.5;
jav=Smm+S3;

    Jav(k)=jav;
    EPR(k)=epr;

end
  

end

clc
clear all
close all
L=100;
i=1;
d1=100;
d2=200;
w=10000000;
pcd=0.1;
pbs=30;
pcbs=10;
% a=8;
% for pd1=0.01:0.01:0.25
% for j=1:100
%    dp=sqrt(0.25*2*10^7);
%    Pbs=sqrt(30*2*10^7);
% z1=dp*randi(1,L);%signal d2d aval
% z2=dp*randi(1,L);%signal d2d dovom
% z3=pbs*randi(1,L);
% sigLength = length(z1); % length
% awgnNoise = sqrt(10^(-17.4))*randn(size(z1)); % orignal noise
% pwrNoise = sqrt(sum(awgnNoise.^2))/sigLength; % noise power
% %awgnNoise1=(awgnNoise-mean(awgnNoise))/var(awgnNoise);
% x = randn(1, L); 
% y = randn(1, L);
%  if z1(j)==dp;
% z11(j)=z1(j)+awgnNoise(j);
% pwrSig1 = (sqrt(z11(j)^2))/sigLength; % signal power
% %channel ba tozieh Rayleigh 
% ho=x(j)+1i*y(j);% kanal byne d2dha 
% r1 = sqrt((x.^2 + y.^2));
% pr=pwrSig1*((abs(r1)).^2);
% j=j+1;
%  else if z1(j)==0
%          j=j+1;
%      else if j==100   
%    break  
%          else
%              j=j+1;
%      end 
%      end
%  end
% pr1=pr;
% pr=pwrSig1*((abs(r1)).^2);
% %mohasebey snr
% snrA=pr/pwrNoise;
% %mohasebeye nerkhe ersale D2D
% Rated2d1=log2(1+(snrA-10^7));
% %         dp=sqrt(0.25*2*10^7);
% % for pd1=0.01:0.01:0.25
% for j=1:100
%       Pbs=sqrt(30*2*10^7);
% 
% zbs=Pbs*randi(1,L);
%  sigLengthd = length(zbs); % length
%  awgnNoised = sqrt(10^(-17.4))*randn(size(zbs)); % orignal noise
% % pwrNoise = sqrt(sum(awgnNoise.^2))/sigLength; % noise power
% % awgnNoise1=(awgnNoise-mean(awgnNoise))/var(awgnNoise);
% % x = randn(1, L); 
% 
% 
%  if zbs(j)==Pbs
% z33(j)=zbs(j)+awgnNoise(j);
% pwrSig3 = (sqrt(z33(j)^2))/sigLength; % signal power
% %channel ba tozieh Rayleigh 
% ho=x(j)+1i*y(j);% kanal byne d2dha 
% r3 = sqrt(0.5*(x.^2 + y.^2));
% pr3=pwrSig3*((abs(r3)).^2);
%  j=j+1;
%  else if z3(j)==0
%          j=j+1;
%      else if j==100   
%    break  
%          else
%              j=j+1;
%      end 
%      end
%  end
% pr33=pr3;
% 
% % mohasebey snr
% snrA3=pr33/pwrNoise;
% % mohasebeye nerkhe ersale D2D
% Rated2d3=log2(1+(snrA3-10^7));
% end
% Rated2d=2*Rated2d1+2*Rated2d3;
% end
% % rate=Rated2d;
% %   for i=1:100
%  RATd2d(1,i)=mean(Rated2d);
% %  SNR(i)=mean(sn1);
%  pd2=pd1*((d2/d1)^a);
% % pd2=0.25;
%  pt=40.1+pd1+pd2+2*pcd;
%  eea(i)=RATd2d(1,i)/pt;
%     i=i+1;
% end
% 
% pd1=0.01:0.01:0.25;
% plot(pd1,eea,'r-')
% hold on
plo=1.5;
dd=20;
a=4;
no=10^(-17.4);
u=1;
for pd1=0:0.01:0.25
    snrA1=pd1./(w*no*plo*(dd^a));
    t=1/(snrA1-7);
     pd2=pd1*(d2/d1)^a;
 pt=40.1+pd1+pd2+2*pcd;
eeA=w*exp(t)*((log(1)-log(t)-1+t)/(2*log(2)*pt));

     eeA1(1,u)=mean(eeA)/10^6;
    u=u+1;
end
    pd1=0:0.01:0.25;
plot(pd1,eeA1,'r--')
hold on
m=1;
for pd1=0:0.01:0.25

    snrA1=pd1/(w*no*plo*(dd^a));
    t=1/(snrA1-(10^0.7));
    t3=1.5960715;
     pd2=pd1*(d2/d1)^a;
 pt=40.1+pd1+pd2+2*pcd;

eeA=w*exp(t)*((log(t3)-t3+((t3)^2/4)-((t3)^3/18)-log(t)+t-(t^2/4)+(t^3/18))/(2*log(2)*pt));

     eeA1(1,m)=mean(eeA)/10^6;
    m=m+1;
end
pd1=0:0.01:0.25;
plot(pd1,eeA1,'g-')
hold on
n=1;
for pd1=0:0.01:0.25
  
    snrA5=pd1/(w*no*plo*(dd^a));
    t=1/(snrA5-7);
    t5=2.1806071;
     pd2=pd1*(d2/d1)^a;
 pt=40.1+pd1+pd2+2*pcd;

eeA5=w*exp(t)*(((log(t5)-t5+((t5)^2/4)-((t5)^3/18)+((t5)^4/96)-((t5)^5/600)-log(t)+t-((t^2)/4)+((t^3)/18)-((t^4)/96)+((t^5)/600)))/(2*log(2)*pt));

     eeA15(1,n)=mean(eeA5)/10^6;
    n=n+1;
end
    pd1=0:0.01:0.25;
plot(pd1,eeA15,'k--')
hold on
u=1;
for pd1=0:0.01:0.25

    snrA7=pd1/(w*no*plo*(dd^a));
    t=1/(snrA7-(10^0.7));
    t7=2.7590025;
     pd2=pd1*((d2/d1)^a);
 pt=40.1+pd1+pd2+2*pcd;

eeA7=w*exp(t)*((log(t7)-t7+((t7^2)/4)-((t7^3)/18)+((t7^4)/96)-((t7^5)/600)+((t7^6)/4320)-((t7^7)/35280)-log(t)+t-((t^2)/4)+((t^3)/18)-((t^4)/96)+((t^5)/600)-((t^6)/4320)+((t^7)/35280)))/(2*log(2)*pt);

     eeA17(1,u)=mean(eeA7)/10^6;
    u=u+1;
end
    pd1=0:0.01:0.25;
plot(pd1,eeA17,'m--')
% 
xlabel('pd1(m)')
ylabel('energy-efficiency(Mbits/Joule)')
title ('Traditional Cellular UEs through BS')
legend('Through BS-Analytical N=1','Through Bs-Analytical N=3','Through BS-Analytical N=5','Through BS-Analytical N=7')
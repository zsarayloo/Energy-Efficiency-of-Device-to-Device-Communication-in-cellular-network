clc
clear all
close all
w=10000000;
pcd=0.1;
pcbs=10;
plo=0.5;
dd=20;
a=2;
L=100;
no=10^(-17.4);
n=0.7;
u=1;
for pd1=0:0.01:0.25
    snrA1=pd1./(w*no*plo*(dd^a));
    t=1/(snrA1-7);
    pd2=pd1*((1-n/n)^a);
 pt=2*pd1+pd2+0.3;
eeA=w*exp(t)*(log(1)-log(t)-1+t)/(2*log(2)*pt);

     eeA1(1,u)=mean(eeA)/10^6;
    u=u+1;
end
    pd1=0:0.01:0.25;
plot(pd1,eeA1,'r--')
hold on
m=1;
for pd1=0:0.01:0.25
%     for ho=1:100000
    snrA1=pd1/(w*no*plo*(dd^a));
    t=1/(snrA1-7);
    t3=1.5960715;
    pd2=pd1*(1-n/n)^a;
 pt=2*pd1+pd2+0.3;
%     eeA=w.*(log2(1+snrA*(abs(ho)^2)))./(2*pd+0.2);
eeA=w*exp(t)*((log(t3)-t3+((t3)^2/4)-((t3)^3/18)-log(t)+t-(t^2/4)+(t^3/18))/(2*log(2)*pt));

     eeA1(1,m)=mean(eeA)/10^6;
    m=m+1;
end
pd1=0:0.01:0.25;
plot(pd1,eeA1,'g-')
hold on
n=1;
for pd1=0:0.01:0.25
%     for ho=1:100000
    snrA5=pd1/(w*no*plo*(dd^a));
    t=1/(snrA5-(10^0.7));
    t5=2.1806071;
    pd2=pd1*((1-n/n)^a);
 pt=2*pd1+pd2+0.3;
%     eeA=w.*(log2(1+snrA*(abs(ho)^2)))./(2*pd+0.2);
eeA5=w*exp(t)*(((log(t5)-t5+((t5)^2/4)-((t5)^3/18)+((t5)^4/96)-((t5)^5/600)-log(t)+t-((t^2)/4)+((t^3)/18)-((t^4)/96)+((t^5)/600)))/(2*log(2)*pt));

     eeA15(1,n)=mean(eeA5)/10^6;
    n=n+1;
end
    pd1=0:0.01:0.25;
plot(pd1,eeA15,'k--')
hold on
u=1;
for pd1=0:0.01:0.25
%     for ho=1:100000
    snrA7=pd1/(w*no*plo*(dd^a));
    t=1/(snrA7-10^0.7);
    t7=2.7590025;
    pd2=pd1*((1-n/n)^a);
 pt=2*pd1+pd2+0.3;
%     eeA=w.*(log2(1+snrA*(abs(ho)^2)))./(2*pd+0.2);
eeA7=w*exp(t)*((log(t7)-t7+((t7^2)/4)-((t7^3)/18)+((t7^4)/96)-((t7^5)/600)+((t7^6)/4320)-((t7^7)/35280)-log(t)+t-((t^2)/4)+((t^3)/18)-((t^4)/96)+((t^5)/600)-((t^6)/4320)+((t^7)/35280)))/(2*log(2)*pt);

     eeA17(1,u)=mean(eeA7)/10^6;
    u=u+1;
end
    pd1=0:0.01:0.25;
plot(pd1,eeA17,'m--')
hold on

i=1;
plo=5;
n=0.5;
a=4;
%  k=1:100;
for pd1=0:0.01:0.25
for j=1:100
        dp=sqrt(0.25);
%         Pbs=sqrt(30*2*10^7);
z1=dp*randi(1,L);%signal d2d aval
z2=dp*randi(1,L);%signal d2d dovom
z3=dp*randi(1,L);
sigLength = length(z1); % length
awgnNoise = sqrt(10^(-10.4))*randn(size(z1)); % orignal noise
pwrNoise = sqrt(sum(awgnNoise.^2))/sigLength; % noise power
%awgnNoise1=(awgnNoise-mean(awgnNoise))/var(awgnNoise);
x = randn(1, L); 
y = randn(1, L);
 if z1(j)==dp;
z11(j)=z1(j)+awgnNoise(j);
pwrSig1 = (sqrt(z11(j)^2))/sigLength; % signal power
%channel ba tozieh Rayleigh 
ho=x(j)+1i*y(j);% kanal byne d2dha 
r1 = sqrt(0.5*(x.^2 + y.^2));
pr=pwrSig1*((abs(r1)).^2);
j=j+1;
 else if z1(j)==0
         j=j+1;
     else if j==100   
   break  
         else
             j=j+1;
     end 
     end
 end
pr1=pr;
pr=pwrSig1*((abs(r1)).^2);
%mohasebey snr
snrA=pr/pwrNoise;
%mohasebeye nerkhe ersale D2D
Rated2d1=log2(1+(snrA-7));

Rated2d=4*Rated2d1;
end
%   for i=1:100
 RATd2d(1,i)=mean(Rated2d);
%  SNR(i)=mean(sn1);
pd2=pd1*((1-n/n)^a);
 pt=2*pd1+pd2+0.3;
 eea(i)=RATd2d(1,i)/(pt);
    i=i+1;
end

    pd1=0:0.01:0.25;
plot(pd1,eea,'r-')
hold on
title('D2D energy-efficiency interms of pd1')
xlabel('pd1')
ylabel('energy-efficiency')
% figure,plot(pd1,RATd2d,'-sg')
% title('D2D rate interms of pd1')
% xlabel('pd1')
% ylabel('D2D Rate interms of pd1')

% figure,plot(pd1,SNR,'-sg')
% title('D2D SNR(db) interms of pd1')
% xlabel('pd1')
% ylabel('average received SNR(db)')
%**************
% dd=20;
% ddk=dd/1000;%faseleye D2Dha az ham
% %path loss model for D2D link
% pld=148+40*log10(ddk);
% Lpd=pld/10;
% pla=10^Lpd;
% h=(abs(ho).^2)/pla;
legend('Direct D2D-Analytical N=1','Direct D2D-Analytical N=3','Direct D2D-Analytical N=5','Direct D2D-Analytical N=7','Direct D2D-Simulation')
    

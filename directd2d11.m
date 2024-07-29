close all
clear
clc 
w=10000000;
plo=4;
dd=20;
a=4;
L=100;
no=10^(-17.4);
u=1;
for pd1=0:0.01:0.25
    snrA1=pd1./(w*no*plo*(dd^a));
    t=1/(snrA1-7);
eeA=w*exp(t)*(log(1)-log(t)-1+t)/(log(2)*(2*pd1+0.2));

     eeA1(1,u)=mean(eeA)/10^6;
    u=u+1;
end
    pd1=0:0.01:0.25;
plot(pd1,eeA1,'r--')
hold on
% plo=1;
m=1;
for pd1=0:0.01:0.25
%     for ho=1:100000
    snrA3=pd1/(w*no*plo*(dd^a));
    t=1/(snrA3-7);
    t3=1.5960715;
%     eeA=w.*(log2(1+snrA*(abs(ho)^2)))./(2*pd+0.2);
eeA=w*exp(t)*(log(t3)-t3+((t3^2)/4)-((t3^3)/18)-log(t)+t-((t^2)/4)+((t^3)/18))/(log(2)*(2*pd1+0.2));

     eeA3(1,m)=mean(eeA)/10^6;
    m=m+1;
end
pd1=0:0.01:0.25;
plot(pd1,eeA3,'g-')
hold on
n=1;
for pd1=0:0.01:0.25
%     for ho=1:100000
    snrA5=pd1/(w*no*plo*dd^a);
    t=1/(snrA5-7);
    t5=2.1806071;
%     eeA=w.*(log2(1+snrA*(abs(ho)^2)))./(2*pd+0.2);
eeA5=w*exp(t)*(log(t5)-t5+((t5^2)/4)-((t5^3)/18)+((t5^4)/96)-((t5^5)/600)-log(t)+t-((t^2)/4)+((t^3)/18)-((t^4)/96)+((t^5)/600))/(log(2)*(2*pd1+0.2));

     eeA15(1,n)=mean(eeA5)/10^6;
    n=n+1;
end
    pd1=0:0.01:0.25;
plot(pd1,eeA15,'k--')
u=1;
for pd1=0:0.01:0.25
%     for ho=1:100000
    snrB=pd1/(w*no*plo*(dd^a));
    t=1/(snrB-7);
    t1=2.7590025;
%     eeA=w.*(log2(1+snrA*(abs(ho)^2)))./(2*pd+0.2);
eeA7=w*exp(t)*((log(t1)-t1+((t1^2)/4)-((t1^3)/18)+((t1^4)/96)-((t1^5)/600)+((t1^6)/4320)-((t1^7)/35280)-log(t)+t-((t^2)/4)+((t^3)/18)-((t^4)/96)+((t^5)/600)-((t^6)/4320)+((t^7)/35280)))/(log(2)*(2*pd1+0.2));

     eeA17(1,u)=mean(eeA7)/10^6;
    u=u+1;
end
    pd1=0:0.01:0.25;
plot(pd1,eeA17,'m--')
hold on
i=1;
%  for k=1:100

for pd1=0:0.01:.25
    for j=1:100
        dp=sqrt(0.25);
z=dp.*randi(1,L);%signal
sigLength = length(z); % length
awgnNoise = sqrt(10^(-17.4)).*randn(size(z)); % orignal noise

%awgnNoise1=(awgnNoise-mean(awgnNoise))/var(awgnNoise);
x = randn(1, L); 
y = randn(1, L);
z1=zeros(1,100);
 if z(j)==dp;
z1(j)=z(j)+awgnNoise(j);
pwrSig = (sqrt(z1(j).^2))./sigLength; % signal power
%channel ba tozieh Rayleigh 
ho(i)=x(j)+1i*y(j);% kanal byne d2dha 
r = sqrt(0.5*(x.^2 + y.^2));
pr=pwrSig.*((abs(r)).^2);
j=j+1;
 else if z(j)==0
    j=j+1;
 else if j==100   
    break  
 else
    j=j+1;
    end 
    end
 end
% pr1=pr;
pwrNoise = sqrt(sum(awgnNoise.^2))./sigLength; % noise power
%mohasebey snr
snrA=(pr/pwrNoise)-7;
%mohasebeye nerkhe ersale D2D
Rated2d=log2(1+(snrA));
sn1=10*log(snrA);
sn2=10.^(sn1./10);
% Rd2d(1,j)=Rated2d;
    end
 RATd2d(1,i)=mean(Rated2d);
 SNR(i)=mean(sn1);
 eea(i)=2*RATd2d(1,i)./(0.2+2*pd1);
    i=i+1;
end

    pd1=0:0.01:0.25;
plot(pd1,eea,'r-')
title('D2D energy-efficiency interms of pd')
xlabel('pd1')
ylabel('energy-efficiency')


clc;  
clear;  
% 获取噪声信号  
data = xlsread('E.xlsx');
[m, n] = size(data);
leleccum = data(:, 8);
indx = 1:m;
x = leleccum(indx);

lev=5;
wname='db3';
[c,l]=wavedec(x,lev,wname);
sigma=wnoisest(c,l,1);
alpha=2;
thr1=wbmpen(c,l,sigma,alpha)
[thr2,nkeep]=wdcbm(c,l,alpha)
xd1=wdencmp('gbl',c,l,wname,lev,thr1,'s',1);
[xd2,cxd,lxd,perf0,perfl2]=wdencmp('lvd',c,l,wname,lev,thr2,'h');
[thr,sorh,keepapp]=ddencmp('den','wv',x)
xd3=wdencmp('gbl',c,l,wname,lev,thr,'s',1);
subplot(411);plot(x);title('原始信号','fontsize',12);
subplot(412);plot(xd1);title('使用penalty阈值降噪后信号','fontsize',12);
subplot(413);plot(xd2);title('使用Birge-Massart阈值降噪后信号','fontsize',12);
subplot(414);plot(xd3);title('使用缺省阈值降噪后信号','fontsize',12);

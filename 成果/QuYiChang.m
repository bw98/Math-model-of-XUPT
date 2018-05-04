clc;
clear all;
%导入参数数据
a=xlsread('A_222（有故障）.xlsx');
[m,n]=size(a);
%对筛选出的 17 组参数进行处理
for j=1:20
e=ones(m,1);
omega=1+0.4*log(3563);
average=mean(a(:,j)); %求平均值
sigma=std(a(:,j)); %求标准差
outliers(:,j)=abs(a(:,j)-e*average)>omega*e*sigma; %肖维勒判断
end
for i=1:m
for j=1:n
if outliers(i,j)==1
a(i,j)=nan;
%异常的数据用 NAN 取代
end
end
end
[x,y]=find(isnan(a)==1);
a(x,:)=[];

clc;
clear all;
%由工作环境B的正常数据的参数7的前五组预测第六组数据
%输入前五组数据及其相应训练结果
P =[356 356 356;356 356 360;356 360 356;360 356 356;356 356 356];
T = [360 356 356 356 356];
pmax = max(P);
pmax1 = max(pmax);
pmin = min(P);
pmin1 = min(pmin);
%归一化处理
for i=1:5
P1(i,:)=(P(i,:)-pmin1)/(pmax1-pmin1);
T1(i)=(T(i)-pmin1)/(pmax1-pmin1);
end
net = newff(P1',T1,[3 7],{'tansig' 'logsig'},'traingd');
%设置训练参数
for i = 1:5
net.trainParam.epochs = 15000;
net.trainParam.goal=0.01;
19net.trainParam.lr = 0.1
net = train(net,P1(i,:)',T1(i));
end
y=sim(net,[356 356 356]');
y1=y*(pmax1-pmin1)+pmin1; %反归一化处理

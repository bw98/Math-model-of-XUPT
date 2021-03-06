%clear all;
clc
%导入参数数据
%a=xlsread('A_2222（正常）.xlsx');
%a是*.xlsx经过肖维勒准则处理后的数据集
data=a(:, :);
figure,plot(data);
xlabel('(s)');
ylabel('变量y');
title('原始数据');
%为角度赋初始值
a=pi/8;
b=pi/8;
%为重构滤波器h0(n)冲激响应赋值
h0=cos(a)*cos(b);
h1=sin(a)*cos(b);
h2=-sin(a)*sin(b);
h3=cos(a)*sin(b);
construct=[h0,h1,h2,h3];
frequency=4;
%设定滤波器长度
decompose=construct(end:-1:1); %确定h0(-n),分解滤波器
%导入参数数据
%a=xlsread('A_2222（正常）.xlsx');
figure,plot(data);
xlabel('时间(s)');
ylabel('变量y');
title('原始数据');
figure(1);
plot(data);
title('原数据');
%h0(n)性质校验
check1=sum(decompose);
check2=norm(decompose);
frequency=conv(data,decompose);%卷积
frequency_down=dyaddown(frequency);%信号低频细节
figure(2);
plot(frequency_down);
title('小波分析的低频系数');
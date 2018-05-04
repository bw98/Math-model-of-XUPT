clear;
clc;
%A1 导致故障的样本集，A2 导致正常的样本集，两者参数项都取正常的参数,不存在则为0
data_gz = xlsread('A1.xlsx');
[a, b] = size(data_gz);
data_zc = xlsread('A2.xlsx');
[c, d] = size(data_zc);

%idx表示五个主要参数
%idx = [3, 5 , 6, 7 , 8];

%求解故障判定距离
sum = 0
for j = 2 : b
    %求解欧氏距离
    if j == 3 || j == 5 || j == 6 || j == 7 || j == 8
    x1 = mean(data_gz(:,j));
    x2 = mean(data_zc(:, j));
    %x1
    %x2
    dis = abs(x2 * x2 - x1 * x1);
    %dis
    sum = sum + dis;
    %sum
    dis = 0;
    end
end

sqrt(sum)
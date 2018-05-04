clear;
clc;


for i=2 : 19
data=xlsread('A1.xlsx');
time=data(:,1);
x=data(:,i);

figure('Color', 'w');
plot(x, 'LineWidth', 1);
grid on;
hold on;

[pk, loc] =findpeaks(x);
%loc
delta=[];
for i = 2:length(loc)
    delta=loc(i)-loc(i-1);
end

mean(delta)
end
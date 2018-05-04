%首先对数据采用肖维勒和拉依达方法进行预处理，检验是否存在偏差较大的异常点。   
dataNUM=length(datax);   
datax_NEW=datax;   
w=1+0.4*log(dataNUM);%若采用拉依达方法，w=3   
removedata = abs(datax_NEW-mean(datax_NEW)) > w*std(datax_NEW);   
datax_NEW(removedata)=[];2）

%利用hist函数查看去除误差点以后的数据直方图，可以直观的判断是否具有较为典型的高斯分布特征。
hist(datax,scalar)；

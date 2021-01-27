------------------------------------------最小二乘实现一元线性回归(matlab)
% x,y为所给数据

x = [23.80,27.60,31.60,32.40,33.70,34.90,43.20,52.80,63.80,73.40]; 
y = [41.4,51.8,61.7,67.90,68.70,77.50,95.90,137.40,155.0,175.0];
plot(x,y,'r* ')
set(gca,'linewidth',2);
Lxx = sum((x-mean(x)).^2);
Lxy = sum((x-mean(x)).*(y-mean(y)));
b1 = Lxy / Lxx;
b0 = mean(y) - b1 * mean(x);
y1 = b1 * x + b0;
hold on
plot(x,y1,'linewidth',2)

% 观察图形中绘制曲线是否与点大部分重合，再进行线性回归

result = LinearModel.fit(x,y)

% Estimate  是系数估计
% SE        是系数的标准误差
% pValue    是对应系数是否等于零的假设检验的t统计量的p值。例如，x的t统计量的p值大于0.05，因此该项在模型中其他项的5%显著性水平上不显著
% R-squared 是决定系数
------------------------------------------------------------------------



------------------------------------------实现一元非线性回归(matlab)
x=[1.5, 4.5, 7.5,10.5,13.5,16.5,19.5,22.5,25.5];
y=[7.0,4.8,3.6,3.1,2.7,2.5,2.4,2.3,2.2];
plot(x,y,'*','linewidth',2);
set(gca,'linewidth',2);

% 指数型
m1 = @(b,x) b(1) + b(2)*log(x);       %定义简单的内联函数
nonlinfit1 = fitnlm(x,y,m1,[0.01;0.01])
b=nonlinfit1.Coefficients.Estimate;
Y1=b(1,1)+b(2,1)*log(x);
hold on
plot(x,Y1,'--k','linewidth',2)

% 对数型
m2 = 'y ~ b1*x^b2';
nonlinfit2 = fitnlm(x,y,m2,[1;1])
b1=nonlinfit2.Coefficients.Estimate(1,1);
b2=nonlinfit2.Coefficients.Estimate(2,1);
Y2=b1*x.^b2;
hold on
plot(x,Y2,'r','linewidth',2)

%比较两种形式下R-squared，更大的显然更优
------------------------------------------------------------------------



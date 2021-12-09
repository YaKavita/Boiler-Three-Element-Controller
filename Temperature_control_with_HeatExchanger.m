num1=1;
den1=[20 1];
Gp=tf(num1,den1,'InputDelay',15); % transfer function of plant with input delay of 15 seconds
num2=1;
den2=[20,1];
Gd=tf(num2,den2,'InputDelay',30); % transfer function of disturbance introduced in the system due to inlet fluid temperature
t=linspace(0,60,1);
[y,t]=step(Gp,t);
plot(t,y)
axis([0 60 0 1]);

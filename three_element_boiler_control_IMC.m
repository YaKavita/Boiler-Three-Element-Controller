clear all
close all
clc
tau=72;
num1=[-0.25 0.25];
den1=[0.3 2.15 1 0];
tf1=tf(num1,den1); % process transfer function(includes process function and valve function)
%% IMC controller
% [num,den]=tf2zp(num1,den1);
% s=tf('s')
% Gp_inv=0.25/((s+6.6667)*(s+0.5))
% Qc=inv(Gp_inv)
% Qc_s=Qc*1/(tau*s+1)
% Controller_tf=Qc_s/(1-Qc_s*Gp_inv)
controller_tf=tf([1.2 8.6 4],[1 3 4]);
TF=feedback(controller_tf*tf1,1);
[y,t]=step(TF,120);
step1=ones(length(t(:,1)),1);
figure
plot(t,step1,'DisplayName','step')
hold on
plot(t,y,'DisplayName','Control Variable')
legend()
axis([0 60 0 1.5])
title('IMC based PID')
%% IMC with feedforward for disturbance rejection

% Program name PNN using gas data
% Configuration of input data (X, Y)
% [u(t-delay_u) u(t-delay_u+1) u(t-delay_u+2) u(t-delay_u+3)...
%  y(t-delay_y) u(t-delay_y+1)u(t-delay_y+2) u(t-delay_y+3)]��
clear all;
close all;
clc;
Simulation_Data =3; 
[X,Y_raw,name]=data_read(Simulation_Data);%���ݶ�ȡ
warning off;
%�������� 1��MPG 2:HOUSING 
% 3:iris(classification)
[Y,num_class]=onehot(Y_raw);%onthot encoding
Kfold = 10;
fprintf('dataset is%s',name); 

[X_tr,Y_tr,X_te,Y_te,Num_tr,Num_te]=Kfold_Data_fix(X,Y,Kfold);%K�۽�����֤
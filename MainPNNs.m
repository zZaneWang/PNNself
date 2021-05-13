% Program name： MultiplePNN
% Wang Zhen
clear all;   close all;   clc;   warning off;
Kfold = 10;
%------------------------------------------------------PNN Initialization---------------------------------
% L=[0  0.1  0.01  0.001];   
% AllEPIMeanSTD=[];   
% BestResult=[];    bestResult=[];
Evaluation_Method=2;                                    % 1: MSE    2: RMSE
Kfold = 10;
Max=30;                                                 %Polynomial Neuron Parameters
in1=2;                                                  %Polynomial Neuron Parameters
type1=2;                                                % Type1:Linear  Type2: Qudratic Type3: Modified Quadratic
ITER1=5;                                                % PNN层数
LSE_Method1=3;                                          % learning method：LSE LSE模式
%-------------------------------------------------数据读取和one-hot编码---------------------------
Simulation_Data =3; 
[X,Y_raw,name]=data_read(Simulation_Data);              %数据读取
                                                        %仿真数据 1：MPG     2:HOUSING   3:iris(classification)
[Y,num_class]=onehot(Y_raw);                            %onthot encoding

for i=1:num_class
    [X_tr,Y_tr,X_te,Y_te,Num_tr,Num_te]=Kfold_Data_fix(X,Y,Kfold,i);%K折交叉验证
    pp1=sprintf('------PI node selection in PNN (without Regularization):------');            disp(pp1);
    [min_err1,Y_data1,Y_data_te1, story1,sel_mod1,MeanEPI1,STDEPI1,Res1]=Conventional_PNN2...
    (ITER1,Kfold,X_tr,Y_tr,X_te,Y_te,Num_tr,Num_te,type1,in1,L(1),Evaluation_Method,Max,LSE_Method1,Name);
    
    
    
end
fprintf('dataset is%s',name); 

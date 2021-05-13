function[X,Y_raw,name] = data_read(Simulation_Data)
cd DATA
A=[];
% 1 : MPG  2: HOUSING
%
%
if (Simulation_Data==1)
    A=xlsread('MPG.csv');
    A_temp = A;
    X = A(:,1:end-1);
    Y_raw = A(:,end);
    name='MPG';
    elseif (Simulation_Data==2)
    A=xlsread('housing.csv');
    A_temp = A;
    X = A(:,1:end-1);
    Y_raw = A(:,end);
    name='HOUSING';
    elseif (Simulation_Data==3)
    A=xlsread('iris.csv');
    A_temp = A;
    X = A(:,1:end-1);
    Y_raw = A(:,end);
    name='IRIS';
end
cd ..
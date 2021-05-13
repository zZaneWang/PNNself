[X_tr,Y_tr,X_te,Y_te,Num_tr,Num_te]=Kfold_Data_fix(X,Y,Kfold);
X_tr = []; Y_tr = []; X_te =[]; Y_re=[];%≥ı ºªØ
%--------------
X_temp = X; Y_temp = Y;
data_m = size(X,1);
%  Kfold_cross validation Function
%  SubFunction for get the difference elements in the Big size matrix.  
%  M=sub_extract(B,S)
function [X_tr,Y_tr,X_te,Y_te,Num_tr,Num_te]=Kfold_Data_fix(X,Y,Kfold,i)

X_tr=[];   Y_tr=[]; 
X_te=[];   Y_te=[]; 
Y = Y(:,i);
%--------------------------------------------------------
X_temp=X;    Y_temp=Y;  
data_m = size(X,1);
temp = randperm(data_m);
X= X_temp(temp,:);
Y= Y_temp(temp,:);
%-------------------------------------------------------
[m,n]=size(X);         %  temp1=1:1:m;
if (Kfold==1)   
    l=round(0.6*data_m);
    X_tr= X(temp(1:l),:);
    Y_tr= Y(temp(1:l),:);
    X_te= X(temp(l+1:end),:);
    Y_te= Y(temp(l+1:end),:);    
    Num_tr=size(X_tr,1);
    Num_te=size(X_te,1);
else
    Mo=mod(m,Kfold);
    te_num=fix(m/Kfold);
    X0=X;          Y0=Y;
    Index_tr=zeros(m-te_num,1);      Index_te=zeros(te_num+1,1);
    i=1;       j=1;      Num_te=[];
    %---------------TR Index and TE Index--------------------------------------
    for k=1:Kfold
        Row_b=te_num*(k-1)+1;
        Row_e=te_num*k;
        if(Mo~=0)
            if (i<=Mo)
                Index_te(1,k)=te_num*Kfold+i;    % The ith colomn is for the ith fold.
                Index_te(2:te_num+1,k)=Row_b:1:Row_e;
                Tem=Index_te(:,k);
                aaa=setdiff(temp',Tem);
                Index_tr(1:m-te_num-1,k)=aaa;
            else
                Index_te(1:te_num,k)=Row_b:1:Row_e;
                Tem=Index_te(:,k);
                aaa=setdiff(temp',Tem);
                Index_tr(1:m-te_num,k)=aaa;
            end
            i=i+1;
        else
            Index_te(1:te_num,k)=Row_b:1:Row_e;
            Tem=Index_te(:,k);
            aaa=setdiff(temp',Tem);
            Index_tr(1:m-te_num,k)=aaa;
        end
    end
    %---------------------------TR and TE sets------------------------------
    for j=1:Mo;
        X_te(1:te_num+1,:,j)=X0(Index_te(:,j),:);
        Y_te(1:te_num+1,j)=Y0(Index_te(:,j),:);
        X_tr(1:m-te_num-1,:,j)=X0(Index_tr(1:m-te_num-1,j),:);
        Y_tr(1:m-te_num-1,j)=Y0(Index_tr(1:m-te_num-1,j),:);
    end
    for j=Mo+1:Kfold;
        X_te(1:te_num,:,j)=X0(Index_te(1:te_num,j),:);
        Y_te(1:te_num,j)=Y0(Index_te(1:te_num,j),:);
        X_tr(1:m-te_num,:,j)=X0(Index_tr(:,j),:);
        Y_tr(1:m-te_num,j)=Y0(Index_tr(:,j),:);
    end
    %------------------Number of TR and TE sets-------------------------------
    for ii=1:Kfold
        if (ii<=Mo)
            Num_te(ii)=te_num+1;
            Num_tr(ii)=m-te_num-1;
        else
            Num_te(ii)=te_num;
            Num_tr(ii)=m-te_num;
        end
    end
end
 
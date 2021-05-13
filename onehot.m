function[Y,n] = onehot(Y_raw)
% 产生独热编码矩阵，返回矩阵每列为一个one hot标签
% 输入：labels 包含所有类别标签的类别，1*nums或者nums*1单个类别或者字符向量
% 输出：onehotMatrix
%       独热编码矩阵，nClasses*nums大小，每列中有且仅有一个1，其余为0，nClasses为类别数量，根据输入labels推算
%
n = length(unique(Y_raw));% 一共有多少类
%%%onehot变换行列
Y_raw_row = Y_raw';
onehot = full(ind2vec(Y_raw_row,n)); % ind2vec():将ind标签转换成vec稀疏编码，再由full()转换成OneHotEncoding
Y = onehot';

% labels = categorical(Y_raw(:));
% classes = string(categories(Y_raw));% 顺序为onehot矩阵的每列的类别顺序
% 
% nums = numel(labels);
% nClasses = length(classes);
% onehotMatrix = zeros(nClasses,nums);
% for i = 1:nums
%     ind = classes==string(labels(i));
%     onehotMatrix(ind,i) = 1;
% end
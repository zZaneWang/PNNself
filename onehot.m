function[Y,n] = onehot(Y_raw)
% �������ȱ�����󣬷��ؾ���ÿ��Ϊһ��one hot��ǩ
% ���룺labels ������������ǩ�����1*nums����nums*1�����������ַ�����
% �����onehotMatrix
%       ���ȱ������nClasses*nums��С��ÿ�������ҽ���һ��1������Ϊ0��nClassesΪ�����������������labels����
%
n = length(unique(Y_raw));% һ���ж�����
%%%onehot�任����
Y_raw_row = Y_raw';
onehot = full(ind2vec(Y_raw_row,n)); % ind2vec():��ind��ǩת����vecϡ����룬����full()ת����OneHotEncoding
Y = onehot';

% labels = categorical(Y_raw(:));
% classes = string(categories(Y_raw));% ˳��Ϊonehot�����ÿ�е����˳��
% 
% nums = numel(labels);
% nClasses = length(classes);
% onehotMatrix = zeros(nClasses,nums);
% for i = 1:nums
%     ind = classes==string(labels(i));
%     onehotMatrix(ind,i) = 1;
% end
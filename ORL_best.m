clear;clc;
addpath('./tools','./twist','./compute');
%MSRCV1 WebKB BBC Caltech101 100leaves BBCSport
dataset_name = "ORL";
load('./data/ORL.mat');

gt=truelabel{1}';
cls_num=length(unique(gt));

for v=1:3
    [X{v}]=NormalizeData(data{v});
end

K=length(X);
% ========================== Parameters Setting ==========================
%  K=100.0000,lambda1=0.0001,lambda2=0.0100,lambda3=10.0000 ACC: 1.0000
K=100;
lambda1 = 0.0001;
lambda2 = 0.0100;
lambda3= 10.000;
tic;
[S1] = myFun(X,gt,cls_num,lambda1,lambda2,lambda3,K, dataset_name);

C1 = SpectralClustering(S1,cls_num);  
ACCi = Accuracy(C1,double(gt)); 
fprintf('K=%.4f,lambda1=%.4f lambda2=%.4f lambda3=%.4f ACC %.3f \n', K, lambda1,lambda2,lambda3,ACCi);


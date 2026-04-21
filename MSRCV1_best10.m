clear;clc;
addpath('./tools','./twist','./compute');
load('./data/MSRCV1.mat');
dataset_name="MSRCV1";
gt = Y;
cls_num = length(unique(gt));

 for v=1:6
    [X{v}]=NormalizeData(X{v});
end

K=length(X);

% ========================== Parameters Setting ==========================
K=100;
lambda1 =0.0010;
lambda2 =100.0000;
lambda3= 10.0000;
tic;
[S1] = myFun(X,gt,cls_num,lambda1,lambda2,lambda3,K,dataset_name);

   for i=1:10
   C1{i} = SpectralClustering(S1,cls_num);  
   ACCi(i) = Accuracy(C1{i},double(gt));
 [Fi(i),Pi(i),Ri(i)] = compute_f(gt,C1{i});

[A nmii(i) avgenti(i)] = compute_nmi(C1{i},gt);
    if (min(gt)==0)
        [ARi(i),RIi(i),MIi(i),HIi(i)]=RandIndex(gt+1,C1{i});
    else
        [ARi(i),RIi(i),MIi(i),HIi(i)]=RandIndex(gt,C1{i});
    end
end%for


avgent(1) = mean(avgenti); avgent(2) = std(avgenti);
result.ACC(1)=mean(ACCi); result.ACC(2) = std(ACCi);
result.nmi(1) = mean(nmii); result.nmi(2) = std(nmii);
result.AR(1) = mean(ARi); result.AR(2) = std(ARi);
result.F(1) = mean(Fi); result.F(2) = std(Fi);
result.P(1) = mean(Pi); result.P(2) = std(Pi);
result.R(1) = mean(Ri); result.R(2) = std(Ri);
result
toc;    



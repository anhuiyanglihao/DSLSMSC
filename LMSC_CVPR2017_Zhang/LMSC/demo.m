%% LMSC (CVPR-17)
load('./data/MSRC-v1.mat');
fprintf('Latent representation multiview subspace clustering\n');
X=data;
gt=truelabel{1}';
num_views = size(X,2);
numClust = size(unique(gt),1);

lambda = 0.1; K = 100; 
[nmi,ACC,f,RI,H] = LRMSC(X,gt,numClust,lambda,K);
fprintf('ACC: %d\n', ACC);    
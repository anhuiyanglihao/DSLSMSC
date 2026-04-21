function P=updateP1(Z,H)

J = H*Z';
[U,S,V] = svd (J,'econ'); 

P = U*V';
end

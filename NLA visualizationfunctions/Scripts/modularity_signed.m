function Q = modularity_signed(W,M, gamma)
% Rubinov & Sporns 2011
% adapted from community_louvain.m in BCT toolbox
%   Inputs:
%       W,
%           directed/undirected weighted/binary connection matrix with
%           positive and possibly negative weights.
%       M,
%           community affiliation vector
%       gamma,
%           resolution parameter (optional)
%               gamma>1,        detects smaller modules
%               0<=gamma<1,     detects larger modules
%               gamma=1,        classic modularity (default)
if ~exist('gamma','var')||isempty(gamma)
    gamma=1;        % classic modularity (default)
end

W=double(W);                                % convert to double format

W0 = W.*(W>0);                          %positive weights matrix
s0 = sum(sum(W0));                      %weight of positive links
B0 = W0-gamma*(sum(W0,2)*sum(W0,1))/s0; %positive modularity

W1 =-W.*(W<0);                          %negative weights matrix
s1 = sum(sum(W1));                      %weight of negative links
if s1                                   %negative modularity
    B1 = W1-gamma*(sum(W1,2)*sum(W1,1))/s1;
else
    B1 = 0;
end

B = B0/s0 - B1/(s0+s1);


B = (B+B.')/2;                                          % symmetrize modularity matrix

Q = sum(B(bsxfun(@eq,M,M.')));                        % compute modularity
end
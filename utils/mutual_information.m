function I = mutual_information(P)
% MUTUAL_INFORMATION Compute MI from joint probability matrix P(X,Y)
%
% Input:
%   P - joint probability matrix (rows = X, columns = Y)
%       must sum to 1
%
% Output:
%   I - mutual information in bits

    % Ensure P is double
    P = double(P);

    % Normalize (safety, in case of rounding issues)
    P = P / sum(P(:));

    % Marginals
    Px = sum(P, 2);   % sum over columns (rows)
    Py = sum(P, 1);   % sum over rows (columns)

    % Avoid log(0) by masking nonzero entries
    [i_idx, j_idx] = find(P > 0);

    I = 0;

    for k = 1:length(i_idx)
        i = i_idx(k);
        j = j_idx(k);

        I = I + P(i,j) * log2( P(i,j) / (Px(i) * Py(j)) );
    end
end
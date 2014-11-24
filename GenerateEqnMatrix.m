function [A] = GenerateEqnMatrix(n)
    total_eqn = 2 * (n - 1);
    A = zeros(total_eqn, n ^ 2);
    row_eqn = total_eqn / 2;
    for i = 1:total_eqn
        if i <= row_eqn
            pos_start = n * i - n + 1;
            pos_end = n * i;
            neg_start = n * i + 1;
            neg_end = n * i + n;
            for j = 1: n^2
                if j >= pos_start && j <= pos_end
                    A(i,j) = 1;
                elseif j >= neg_start && j <= neg_end
                    A(i,j) = -1;
                end
            end
        else
            col_eqn = i - row_eqn;
            for j = 1: n^2
                if mod(j - col_eqn + 1, n) == 1
                    A(i,j) = 1;
                elseif j > 1 && A(i, j-1) == 1
                    A(i,j) = -1;
                end
            end
        end
    end
end
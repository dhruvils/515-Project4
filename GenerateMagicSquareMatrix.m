function [A] = GenerateMagicSquareMatrix(n)
    total_eqn = 2 * n;
    A = zeros(total_eqn, n ^ 2);
    row_eqn = total_eqn / 2 - 1;
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
        elseif i == n
            neg_start = 2;
            neg_end = n;
            diag_count = n + 2;
            for j = 1: n^2
                if j >= neg_start && j <= neg_end
                    A(i,j) = -1;
                elseif j > 1 && j == diag_count
                    A(i,j) = 1;
                    diag_count = diag_count + n + 1;
                end
            end
        elseif i == 2*n
            neg_start = 1;
            neg_end = n - 1;
            diag_count = 2 * n - 1;
            for j = 1: n^2
                if j >= neg_start && j <= neg_end
                    A(i,j) = -1;
                elseif j == diag_count && j < n^2
                    A(i,j) = 1;
                    diag_count = diag_count + n - 1;
                end
            end
        else
            col_eqn = i - row_eqn - 1;
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
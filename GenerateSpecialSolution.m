function GenerateSpecialSolution(A, freelist)
    b_spec = A(:, end);
    mat_size = size(A, 1) + length(freelist) - 1;
    mat_count = 1;
    for i = 1:mat_size
        if ismember(i, freelist)
            B(i) = 0;
        else
            B(i) = b_spec(mat_count);
            mat_count = mat_count + 1;
        end
    end
end
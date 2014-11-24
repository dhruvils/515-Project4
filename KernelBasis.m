function KernelBasis(M)
    %reduced_mat = ReducedRowEchelonForm(M);
    reduced_mat = rref(M);
    
    [rowCount, colCount] = size(reduced_mat);
    col_index = 1;
    count = 1;
    imat = eye(rowCount);
    for col = 1:rowCount
        while col_index <= colCount
            temp = bsxfun(@minus, reduced_mat(:, col_index), imat(:, col));
            if any(temp)
                A(:,count) = reduced_mat(:,col_index);
                freelist(count) = col_index;
                col_index = col_index + 1;
                count = count + 1;
            else
                col_index = col_index + 1;
                break;
            end
        end
    end
    while col_index <= colCount
        A(:,count) = reduced_mat(:,col_index);
        freelist(count) = col_index;
        col_index = col_index + 1;
        count = count + 1;
    end
    imat = eye(count - 1);
    mat_size = size(A,1) + count -1;
    mat_count = 1;
    id_count = 1;
    for i = 1:mat_size
        if ismember(i, freelist)
            B(i, :) = imat(id_count, :);
            id_count = id_count + 1;
        else
            B(i, :) = -A(mat_count, :);
            mat_count = mat_count + 1;
        end
    end
    
    index = 1;
    numCols = sqrt(size(B,1));
    for col = 1:size(B,2)
        %bases(index) = vec2mat(A(:,col), numCols);
        vec2mat(B(:,col), numCols)
        index = index + 1;
    end
end
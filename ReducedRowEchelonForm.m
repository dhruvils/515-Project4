function [m] = ReducedRowEchelonForm(m)
    [rowCount, colCount] = size(m);
%    tolerance = 0.2;
    col_index = 1;
    for current_row = 1:rowCount
        if colCount < col_index
            return;
        end
        if m(current_row, col_index) == 0 && current_row == rowCount
            col_index = col_index + 1;
        end
        if colCount < col_index
            return;
        end
        max_val = max(abs(m(:, col_index)))
        for row_index = current_row:rowCount + 1
            if row_index == rowCount + 1
                row_index = current_row;
                col_index = col_index + 1;
            end
            if colCount < col_index
                return;
            end
            if m(row_index, col_index) ~= 0 && abs(m(row_index, col_index)) == max_val
                break;
            end
        end
        %Permute current_row with row_index
        if m(current_row, col_index) == 0
            m([row_index current_row], :) = m([current_row row_index], :);
        end
        
        if m(current_row, col_index) ~= 0
            m(current_row,:) = bsxfun(@rdivide, m(current_row,:), m(current_row, col_index));
        
        
        for  i = 1:rowCount
            if i ~= current_row
                %Subtract M[i, lead] multiplied by row r from row i
                temp = bsxfun(@times, m(current_row, :), m(i, col_index));
                m(i,:) = bsxfun(@minus, m(i,:), temp);
            end
        end
        end
        col_index = col_index + 1;
    end
end
function [M] = ToReducedRowEchelonForm(m)
    lead = 1;
    [rowCount, columnCount] = size(m);
    for r = 1:rowCount 
        if columnCount < lead
            return;
        end
        i = r;
        
        while i < (rowCount + 1) && m(i, lead) == 0
            if (rowCount + 1) == i
                i = r;
                lead = lead + 1;
                if columnCount == lead
                    return;
                end
            end
            i = i + 1;
        end
        m([i, r], :) = m([r, i], :);
        %If M[r, lead] is not 0 divide row r by M[r, lead]
        if m(r, lead) ~= 0
            m(r,:) = bsxfun(@rdivide, m(r,:), m(r, lead));
        end
        for  i = 1:rowCount
            if i ~= r
                %Subtract M[i, lead] multiplied by row r from row i
                temp = bsxfun(@times, m(r, :), m(i, lead));
                m(i,:) = bsxfun(@minus, m(i,:), temp);
            end
        end
        lead = lead + 1;
        m
    end
    M = m
end
function SolutionBasis(B)
    index = 1;
    numCols = sqrt(size(B,1));
    for col = 1:size(B,2)
        %bases(index) = vec2mat(A(:,col), numCols);
        vec2mat(B(:,col), numCols)
        index = index + 1;
    end
end
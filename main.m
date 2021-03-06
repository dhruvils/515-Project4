function main()
    %%for 1.1
    M = [
        1, 0, 2, 1, 5;
        1, 1, 5, 2, 7;
        1, 2, 8, 4, 12;
        ];
    ReducedRowEchelonForm(M)
    rref(M)
    
    %%for 1.2
    M = [
        1, 0, 2, 1, 0, 0;
        1, 1, 5, 0, 1, 0;
        1, 2, 8, 0, 0, 1;
        ];
    ReducedRowEchelonForm(M)
    rref(M)
    
    %%for 1.3
    %%{
    for n = 4:20
        for i = 1:n
            for j = 1:n
                m(i,j) = i + j - 1;
            end
        end
        ReducedRowEchelonForm(m)
        rref(m)
    end
    %}
    %The program seems to match the rref function for all values of n even
    %upto 40. The rank of the matrix A is 2.
    
    %%for 1.4
    %For all values of n = 4-20 the matrix was of the given form. Column 1
    %and Column 2 are linearly independant and all the other columns can be
    %written as a linear combination of these two columns. Therefore the
    %rank of A is 2
    
    %%for 1.5
    %%{
    m = [];
    for n = 4:20
        val = ((2/25) * (n ^ 2));
        for i = 1:n
            for j = 1:n
                m(i,j) = i + j - 1;
                if i == j
                    m(i, j) = m(i, j) + val;
                end
            end
        end
        chol(m)
        ReducedRowEchelonForm(m)
        %rref(m)
    end
    %}
    %After adding the given value to the diagonal elements, we see that the
    %reduced row echelon form is the identity matrix
    
    %%for 2.1
    %%{
    M = [
        1 1 1 1 -1 -1 -1 -1 0 0 0 0 0 0 0 0;
        0 0 0 0 1 1 1 1 -1 -1 -1 -1 0 0 0 0;
        0 0 0 0 0 0 0 0 1 1 1 1 -1 -1 -1 -1;
        1 -1 0 0 1 -1 0 0 1 -1 0 0 1 -1 0 0;
        0 1 -1 0 0 1 -1 0 0 1 -1 0 0 1 -1 0;
        0 0 1 -1 0 0 1 -1 0 0 1 -1 0 0 1 -1;
        ];
    %{
    M = [
        1, 0, 2, 1, 5;
        1, 1, 5, 2, 7;
        1, 2, 8, 4, 12;
        ];
    %}
    %ReducedRowEchelonForm(M)
    %rref(M)
    [Z, ~] = KernelBasis(M);
    Z
    %}
    %%for 2.2
    %%{
    M = [
        1, 0, 2, 1, 5;
        1, 1, 5, 2, 7;
        1, 2, 8, 4, 12;
        ];
    b = [1;2;3];
    A = ReducedRowEchelonFormAugment(M, b);
    [~, freelist] = KernelBasis(A);
    GenerateSpecialSolution(A, freelist);
    %}
    %We see that the above matrix of the form Mx = b has a solution as no
    %pivot is present in b.
    
    %%for 3.1
    GenerateEqnMatrix(4)
    
    %%for 3.2
    %%{
    for i = 2:6
        M = GenerateEqnMatrix(i);
        %ReducedRowEchelonForm(M)
        %rref(M)
        [B, ~] = KernelBasis(M);
        SolutionBasis(B);
    end
    %}
    
    %%for 3.3
    %%{
    M = GenerateMagicSquareMatrix(3);
    [B, ~] = KernelBasis(M);
    SolutionBasis(B);
    %}
end
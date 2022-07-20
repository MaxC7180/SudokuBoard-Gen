function [newM] = sudoku_Board_cleaner(Matrix)
[cols, rows] = size(Matrix);

for i = 1:rows
    for j = 1:cols
        if (Matrix(i,j) > 0)
            for k = (j+1):cols
                if Matrix(i,j) == Matrix(i,k) 
                    Matrix(i,k) = 0;
                end               
            end
            for k = (i+1):rows
                if Matrix(i,j) == Matrix(k,j)
                    Matrix(k,j) = 0;
                end
            end
        end
    end
end
newM = Matrix;
end


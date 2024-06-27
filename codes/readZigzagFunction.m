function outputVector = readZigzagFunction(imageMatrix, handles)
    [rows, ~] = size(imageMatrix);
    outputVector = zeros(1, rows * rows);

    % Initialize variables for the zigzag traversal
    index = 1;

    for sumIdx = 1:rows+rows-1
        if mod(sumIdx, 2) == 1
            % Odd sumIdx: Traverse upward in the column
            for diagIdx = max(1, sumIdx - rows + 1):min(sumIdx, rows)
                outputVector(index) = imageMatrix(diagIdx, sumIdx - diagIdx + 1);
                index = index + 1;
            end
        else
            % Even sumIdx: Traverse downward in the column
            for diagIdx = min(sumIdx, rows):-1:max(1, sumIdx - rows + 1)
                outputVector(index) = imageMatrix(diagIdx, sumIdx - diagIdx + 1);
                index = index + 1;
            end
        end
    end
end


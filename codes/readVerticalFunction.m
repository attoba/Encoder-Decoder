

function outputVector = readVerticalFunction(imageMatrix, handles)
    % Reshape the image matrix to a column vector
    reshapedMatrix = reshape(imageMatrix, [], 1);
    
    % Perform the vertical reading
    outputVector = reshapedMatrix';
    
    
end

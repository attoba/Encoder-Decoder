function performReadings(handles)
    % Perform horizontal reading
    outputVectorHorizontal = readHorizontalFunction(handles.imageMatrix, handles);
    countZerosHorizontal = countConsecutiveZeros(outputVectorHorizontal);
    
    % Perform vertical reading
    outputVectorVertical = readVerticalFunction(handles.imageMatrix, handles);
    countZerosVertical = countConsecutiveZeros(outputVectorVertical);

    % Perform zigzag reading
    outputVectorZigzag = readZigzagFunction(handles.imageMatrix, handles);
    countZerosZigzag = countConsecutiveZeros(outputVectorZigzag);

    % Compare and determine the reading with the longest consecutive zeros
    if countZerosHorizontal > countZerosVertical && countZerosHorizontal > countZerosZigzag
        readingDirection = 'horizontal';
        maxLength = countZerosHorizontal;
    elseif countZerosVertical > countZerosHorizontal && countZerosVertical > countZerosZigzag
        readingDirection = 'vertical';
        maxLength = countZerosVertical;
    else
        readingDirection = 'en zigzag';
        maxLength = countZerosZigzag;
    end

    % Display the results
    set(handles.textHorizontal, 'String', ['Lecture Horizontal : ' num2str(outputVectorHorizontal)]);
    set(handles.textVertical, 'String', ['Lecture Vertical : ' num2str(outputVectorVertical(:)')]);
    set(handles.textZigzag, 'String', ['Lecture en Zigzag : ' num2str(outputVectorZigzag(:)')]);

    % Display the reading with the longest consecutive zeros
    set(handles.textLongestZeros, 'String', ['La plus long suite de zeros est obtenu par la lecture: ' readingDirection '.']);
end

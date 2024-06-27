function loadImage(~, ~)
    % Get the handles structure from the hObject
    handles = guidata(gcf);

    % Allow the user to select an image file
    [filename, pathname] = uigetfile({'*.tif;*.png;*.jpg;*.jpeg;*.bmp', 'Image Files (*.tif,*.png, *.jpg, *.jpeg, *.bmp)'}, 'Select an image');

    % Check if the user canceled the operation
    if isequal(filename, 0) || isequal(pathname, 0)
        return;
    end

    % Read the selected image
    imagePath = fullfile(pathname, filename);
    handles.imageMatrix = imread(imagePath);

    % Check if the image is square
    [rows, cols, ~] = size(handles.imageMatrix);
    if rows ~= cols
        % Display an error message on the interface
        errordlg('Veuillez utiliser une image carrée.', 'Erreur', 'modal');
        return;
    end

    % Perform all three readings
    performReadings(handles);

    % Save the handles structure
    guidata(gcf, handles);
end

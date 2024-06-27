

function InterfaceImage(hObject, ~)
     close(gcf);
    % Create the main figure
    hFigure = figure('Name', " Interface :Lectures d'image", 'Position', [100, 100, 800, 400]);
     % Create a button to return to the acceuil GUI
    uicontrol('Style', 'pushbutton', 'String', "Retour à l'accueil", 'Position', [50, 360, 140, 30], 'Callback', @acceuil);

    % Create a button to load an image
    uicontrol('Style', 'pushbutton', 'String', 'Entrez votre Image Ici','FontSize',14, 'FontWeight', 'bold','Position', [220, 330, 340, 60], 'Callback', @loadImage);

    % Create text boxes for displaying readings
    handles.textHorizontal = uicontrol('Style', 'edit', 'String',sprintf('\n\nLecture Horizontal'),  'FontWeight', 'bold','Position', [50, 210, 290, 100], 'HorizontalAlignment', 'center', 'Max', 5);
    handles.textVertical = uicontrol('Style', 'edit', 'String', sprintf('\n\nLecture Vertical'),'FontWeight', 'bold', 'Position', [480, 210, 290, 100], 'HorizontalAlignment', 'center', 'Max', 5);
    handles.textZigzag = uicontrol('Style', 'edit','String',sprintf('\n\nLecture en Zigzag'), 'FontWeight', 'bold','Position', [250, 100, 290, 100], 'HorizontalAlignment', 'center', 'Max', 5);
    handles.textLongestZeros = uicontrol('Style', 'edit', 'String', sprintf('la lecture par laquelle est obtenu la plus longue suite de zéros'), 'FontWeight', 'bold', 'Position', [50, 30, 700, 30], 'HorizontalAlignment', 'center', 'BackgroundColor', [0.7, 0.9, 0.7]);

    % Save handles structure
    handles.imageMatrix = [];  
    handles.longestZeros = 0;  
    handles.currentReading = '';
    handles.readingWithLongestZeros = '';
    % Save the handles structure
    guidata(hFigure, handles);
end





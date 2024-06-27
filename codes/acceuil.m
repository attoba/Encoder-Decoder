
function acceuil(hObject, ~)
    close(gcf);
    % Create a figure
    fig = figure('Name', 'Acceuil', 'Position', [100, 100, 800, 400]);
    uicontrol('Style', 'text', 'String',  sprintf(' \n\nCommunication Numerique'), 'FontSize', 18, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'Position', [50, 350, 700, 100]);
    %to code text
    box1 = uicontrol('Style', 'text', 'Position', [30, 200, 350, 60], 'String', sprintf(' \n\nVous Voulez Coder Un texte'), 'FontWeight', 'bold', 'HorizontalAlignment', 'center');

    % Create buttons below the left box 
    button1_left = uicontrol('Style', 'text', 'Position', [50, 100, 75, 30], 'String',sprintf('\nNon') ,'FontWeight', 'bold','BackgroundColor',[0.7, 0.1, 0.2]);
    button2_left = uicontrol('Style', 'pushbutton', 'Position', [285, 100, 75, 30], 'String', 'Oui','BackgroundColor', [0.7, 0.9, 0.7], 'Callback', {@InterfaceText, fig});

    % Create box on the right to code image
    box2 = uicontrol('Style', 'text', 'Position', [430, 200, 350, 60], 'String', sprintf('\n\nVous Voulez Coder Une Image'), 'FontWeight', 'bold');

    % Create buttons below the right box
    button1_right = uicontrol('Style', 'text', 'Position', [450, 100, 75, 30], 'String',sprintf('\nNon'),'FontWeight', 'bold','BackgroundColor',[0.7, 0.1, 0.2]);
    button2_right = uicontrol('Style', 'pushbutton', 'Position', [685, 100, 75, 30], 'String', 'Oui','BackgroundColor', [0.7, 0.9, 0.7], 'Callback',{@InterfaceImage});
   
end

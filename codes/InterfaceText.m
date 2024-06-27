

function InterfaceText(~, ~, fig)
close(gcf);
% Création de la figure principale
h = figure('Name', 'Coder Un Texte', 'Position', [100, 100, 800, 400]);

% Big title
uicontrol('Style', 'text', 'String', 'Communication Numerique', 'FontSize', 16, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'Position', [50, 350, 600, 30]);
% Create a button to return to the acceuil GUI
uicontrol('Style', 'pushbutton', 'String', "Retour à l'accueil", 'Position', [50, 350, 140, 30], 'Callback', @acceuil);
% Création d'une zone de saisie pour le texte
hTexte = uicontrol('Style', 'edit', 'String', 'Entrez votre texte','FontSize', 14, 'FontWeight', 'bold', 'Position', [130, 300, 500, 30]);

% Create handles structure
handles.hTexte = hTexte;
handles.rapportHuffText = uicontrol('Style', 'text','String', sprintf('\nRapport De Compression Par Huffman'), 'FontWeight', 'bold', 'Position', [50, 190, 300, 50], 'BackgroundColor', [0.8, 0.8, 0.8]);
handles.rapportSFText = uicontrol('Style', 'text', 'String', sprintf('\nRapport De Compression Par Shannon Fano'),'FontWeight', 'bold', 'Position', [450, 190, 300, 50], 'BackgroundColor', [0.8, 0.8, 0.8]);
handles.performantText = uicontrol('Style', 'text','String', sprintf("\nL'algorithme le plus performant"), 'FontWeight', 'bold', 'Position', [50, 100, 700, 50]);

% Save the handles structure
guidata(h, handles);

uicontrol('Style', 'pushbutton', 'String', 'Coder', 'Position', [340, 260, 100, 30],'Callback', @(src, event) coderTexte(src, event, h));




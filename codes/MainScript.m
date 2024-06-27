


function main()
    % Création de la figure principale
    h = figure('Name', 'Codage de Texte', 'Position', [100, 100, 400, 200]);

    % Création d'une zone de saisie pour le texte
    hTexte = uicontrol('Style', 'edit', 'Position', [50, 100, 300, 30]);

    % Initialization of handles
    handles.hTexte = hTexte;
    handles.rapportHuffText = uicontrol('Style', 'text', 'Position', [50, 20, 300, 20]);
    handles.rapportSFText = uicontrol('Style', 'text', 'Position', [50, 40, 300, 20]);
    handles.performantText = uicontrol('Style', 'text', 'Position', [50, 60, 300, 20]);

    % Save the handles structure using the main figure handle
    guidata(h, handles);

    % Création d'un bouton pour lancer le codage
    uicontrol('Style', 'pushbutton', 'String', 'Coder', ...
        'Position', [150, 50, 100, 30], 'Callback', {@coderTexte, h});
end

function coderTexte(~, ~, hObject)
    % Get the handles structure from the main figure handle
    handles = guidata(hObject);

    % Récupération du texte saisi
    texte = get(handles.hTexte, 'String');

    % Explicitly define symbols and probabilities
    symbols = unique(texte);
    probabilities = ones(size(symbols)) / numel(symbols);

    % Codage du texte selon les deux algorithmes
    huffmanCode = HuffmanCode(symbols, probabilities);
    shannonFanoCode = ShannonFanoCode(texte);

    % Calcul du rapport de compression
    rapportHuff = length(texte) / length(huffmanCode);
    rapportSF = length(texte) / length(shannonFanoCode);

    % Affichage du rapport de compression dans la GUI
    set(handles.rapportHuffText, 'String', ['Rapport de compression Huffman : ' num2str(rapportHuff)]);
    set(handles.rapportSFText, 'String', ['Rapport de compression Shannon Fano : ' num2str(rapportSF)]);

    % Comparaison des deux rapports de compression
    if rapportHuff > rapportSF
        codePlusPerformant = 'Huffman';
    else
        codePlusPerformant = 'Shannon Fano';
    end
    set(handles.performantText, 'String', ['Code le plus performant : ' codePlusPerformant]);
end

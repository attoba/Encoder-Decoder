function coderTexte(~, ~, hObject)
   
   
    % Get the handles structure from the hObject
    handles = guidata(hObject);
    % Retrieve the input text
    texte = get(handles.hTexte, 'String');

    % Check if texte is not empty
    if isempty(texte)
        disp('Input text is empty.');
        return;  % Exit the function
    end
% Calculate symbol probabilities based on their frequencies
    symbols = unique(texte);
    probabilities = zeros(size(symbols));
    
    for i = 1:length(symbols)
        probabilities(i) = sum(texte == symbols(i)) / length(texte);
    end
disp('Symbols and Probabilities:');
disp([symbols', num2cell(probabilities)]);



% Display symbols and their probabilities
disp('Symbols and Probabilities:');
disp([symbols', num2cell(probabilities)]);
    
    % Display symbols and their probabilities
    disp('Symbols and Probabilities:');
    disp([symbols', num2cell(probabilities)]);

    

    % Display symbols and their probabilities
    disp('Symbols and Probabilities:');
    disp([symbols', num2cell(probabilities)]);

    % Call the coding functions with appropriate arguments 
    huffmanCode = HuffmanCode(symbols, probabilities);
    shannonFanoCode = ShannonFanoCode(symbols, probabilities);
    
    % Verify the format of huffmanCode
    disp('Huffman Code Dictionary:');
    disp(huffmanCode);
    disp('ShannonFanoCode Code Dictionary:');
    disp(shannonFanoCode);

    % Encode using Huffman code
    huffmanEncodedText = huffmanenco(texte, huffmanCode(:, 1:2));
    % Encode using Shannon-Fano code
    shannonFanoEncodedText = shannonfanoenco(texte, shannonFanoCode(:, 1:2));

    % Calculate compression ratios separately for Huffman and Shannon Fano
    rapportHuff = numel(texte) * 8 / numel(huffmanEncodedText);  % Assuming 8 bits per character
    rapportSF = numel(texte) * 8 / numel(shannonFanoEncodedText);  % Assuming 8 bits per character

    % Display the compression ratios
    set(handles.rapportHuffText, 'String', [sprintf( ' Rapport de compression par Huffman : ') num2str(rapportHuff)]);
    set(handles.rapportSFText, 'String', [sprintf(' Rapport de compression par Shannon Fano : ') num2str(rapportSF)]);

    % Compare performance and display the result
    if rapportHuff > rapportSF
        codePlusPerformant = 'Huffman';
    elseif rapportSF > rapportHuff
        codePlusPerformant = 'Shannon Fano';
    else
        codePlusPerformant = 'Les deux codes sont identiques';
    end
    set(handles.performantText, 'String', [sprintf('Code le plus performant : ') codePlusPerformant]);
end
function encodedText = shannonfanoenco(text, code)
    encodedText = '';
    for i = 1:length(text)
        symbol = text(i);
        index = find(strcmp(code(:, 1), symbol));
        encodedText = [encodedText code{index, 2}];
    end
end


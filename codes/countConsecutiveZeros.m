


function [countZeros, maxLength] = countConsecutiveZeros(vector)
    countZeros = 0;
    maxLength = 0;

    for i = 1:length(vector)
        if vector(i) == 0
            countZeros = countZeros + 1;
            % Mettre à jour la longueur maximale si nécessaire
            if countZeros > maxLength
                maxLength = countZeros;
            end
        else
            countZeros = 0;
        end
    end
end

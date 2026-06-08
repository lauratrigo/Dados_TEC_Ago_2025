% Seleciona a pasta com os arquivos
folderPath = uigetdir('', 'Selecione a pasta com os arquivos .cmn');
if folderPath == 0
    error('Nenhuma pasta selecionada.');
end

% Lista todos os arquivos .cmn na pasta
fileList = dir(fullfile(folderPath, '*.cmn'));
fileList = {fileList.name};

% Ordena os arquivos para concatenar na ordem correta
fileList = sort(fileList);

% Abre arquivo de saída
outputFile = fullfile(folderPath, 'concat_output.mat');
fidOut = fopen(outputFile, 'w');
if fidOut == -1
    error('Não foi possível criar o arquivo de saída.');
end

% Loop pelos arquivos
for k = 1:length(fileList)
    fileName = fullfile(folderPath, fileList{k});
    fidIn = fopen(fileName, 'r');
    if fidIn == -1
        warning('Não foi possível abrir %s. Pulando.', fileList{k});
        continue;
    end

    % Contador de linhas
    lineNum = 0;
    
    % Lê linha a linha
    while ~feof(fidIn)
        tline = fgetl(fidIn);
        lineNum = lineNum + 1;

        % Primeiro arquivo: manter a terceira linha (cabeçalho)
        if k == 1
            if lineNum == 1 || lineNum == 2 || lineNum == 3
                continue; % descarta 2 primeiras linhas
            end
        else
            if lineNum <= 5
                continue; % descarta 3 primeiras linhas dos arquivos seguintes
            end
        end

        % Escreve no arquivo de saída
%         fprintf(fidOut, '%s', tline);
        % Apenas escreve linhas não vazias
        if ~isempty(tline)
            fprintf(fidOut, '%s\n', tline);
        end
    end

    fclose(fidIn);
    fprintf('Arquivo %d de %d processado: %s\n', k, length(fileList), fileList{k});
end

fclose(fidOut);
disp('Concatenação concluída!');
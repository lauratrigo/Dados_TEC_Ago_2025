clear all; close all; clc;

% =========================================================================
% 1. SELEÇÃO AUTOMÁTICA DA PASTA E ARQUIVOS
% =========================================================================
selPath = uigetdir(pwd, 'Selecione a pasta com os arquivos .txt das estações');
if isequal(selPath, 0), return; end

% Lista todos os arquivos .txt na pasta
fileData = dir(fullfile(selPath, '*.txt'));
fileList = {fileData.name};

if isempty(fileList)
    error('Nenhum arquivo .txt encontrado na pasta selecionada.');
end

% =========================================================================
% 2. CONFIGURAÇÕES DOS DIAS
% =========================================================================
dias_escolhidos = [6 7 16 17 28];
horas_por_dia = 1440; % 1440 minutos = 24h
num_total_dias = 31;
teste = []; % Inicializa a matriz de saída

% =========================================================================
% 3. LOOP DE PROCESSAMENTO
% =========================================================================
for i = 1:length(fileList)
    currentFile = fullfile(selPath, fileList{i});
    fprintf('Processando arquivo %d de %d: %s\n', i, length(fileList), fileList{i});

    fid = fopen(currentFile, 'rt');
    if fid == -1
        fprintf('Erro ao abrir: %s\n', fileList{i});
        continue
    end

    % Lê o conteúdo ignorando o cabeçalho
    raw_data = textscan(fid, '%s', 'Delimiter', '\n', 'HeaderLines', 1);
    fclose(fid);

    % Tratamento de decimal e valores nulos
    clean_raw = strrep(raw_data{1}, ',', '.');
    clean_raw = strrep(clean_raw, '-999.0', 'NaN');

    % Converte para matriz numérica
    try
        data = cell2mat(cellfun(@str2num, clean_raw, 'UniformOutput', false));
    catch
        fprintf('Erro na conversão numérica do arquivo %s. Pulando.\n', fileList{i});
        continue;
    end

    % --- Processamento TEC ---
    media = data(:, 1);
    vtec_cols = data(:, 5:2:end); % Pega as colunas de VTEC (dias 1 a 31)
    
    % Lineariza os 31 dias (Transforma a matriz em um vetor coluna longo)
    % Usar vtec_cols' (transposta) garante que o reshape siga a ordem dos dias corretamente
    vtec_longo = reshape(vtec_cols', [], 1);%BAITA ERRO!!!
    
    % Expande a média para bater com o tamanho dos 31 dias
    media_expand = repmat(media, num_total_dias, 1);
    
    media_expand=movmean(media_expand,360, 'omitnan');

    % Calcula a diferença total
    diff_TEC_total = vtec_longo - media_expand;

    % --- Extração dos Dias Escolhidos ---
    idx_final = [];
    for d = dias_escolhidos
        inicio = (d-1)*horas_por_dia + 1;
        fim = d*horas_por_dia;
        idx_final = [idx_final inicio:fim];
    end

    % Armazena apenas os dados dos dias de interesse na matriz final
    if length(diff_TEC_total) >= max(idx_final)
        teste(:, i) = media_expand(idx_final);
    else
        fprintf('Aviso: Arquivo %s tem menos dados que o esperado.\n', fileList{i});
    end
end

% =========================================================================
% 4. SALVAMENTO
% =========================================================================
output_folder = fullfile(selPath, 'formatado');
if ~exist(output_folder, 'dir'), mkdir(output_folder); end

% Cria um nome de arquivo que indica quais dias foram extraídos
dias_str = sprintf('%d_', dias_escolhidos);
output_name = ['matrix_mediaTEC_Aug2025_dias_calmos', dias_str(1:end-1), '.txt'];
output_file = fullfile(output_folder, output_name);

writematrix(teste, output_file, 'Delimiter', ' ');

fprintf('\n=== Processamento finalizado! ===\n');
fprintf('Arquivo salvo em: %s\n', output_file);
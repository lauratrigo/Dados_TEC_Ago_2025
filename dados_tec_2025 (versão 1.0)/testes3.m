clear; close all; clc;

% 1. CONFIGURAÇÕES
lat_epi = -30.2789; 
lon_epi = -67.4757; 
t_quake = 20.7; 

% 2. CARREGAR ARQUIVO CONCATENADO (Seu arquivo .txt gerado)
[concatFile, concatPath] = uigetfile('*.txt','Selecione o arquivo concat_output.txt');
if isequal(concatFile,0), return; end
concatFile = fullfile(concatPath,concatFile);

% Importação otimizada para arquivos grandes
opts = detectImportOptions(concatFile,'FileType','text');
opts.VariableNamesLine = 1; % Assume que a linha 3 que você manteve virou a 1
T = readtable(concatFile, opts);

% 3. EXTRAIR E FILTRAR
% Usando os nomes exatos das colunas do seu cabeçalho .cmn
t_min = (T.Time - t_quake) * 60;
idx = (t_min > -10) & (t_min < 90);

t_plot = t_min(idx);
ele_plot = T.Ele(idx);
prn_plot = T.PRN(idx);

unique_prns = unique(prn_plot);

% 4. PLOTAGEM ESTILO JGR
% O artigo foca em PRNs específicos (ex: G27, G16, G31). 
% Vou criar uma lógica que agrupa as estações por satélite.

for i = 1:length(unique_prns)
    curr_prn = unique_prns(i);
    id = (prn_plot == curr_prn);
    
    % Se o satélite tiver poucos dados, pula (opcional)
    if sum(id) < 100, continue; end
    
    figure('Color','w','Position',[200 200 600 400])
    hold on;
    
    % O SEGREDO: Plotar como pontos pequenos ou linhas com transparência
    % Como são 7k estações, 'plot' normal vira um borrão. 
    % Usamos uma cor verde oliva com 0.05 de opacidade.
    scatter(t_plot(id), ele_plot(id), 2, [0.1 0.6 0.1], 'filled', ...
            'MarkerFaceAlpha', 0.1, 'MarkerEdgeAlpha', 0.1);
    
    % Estética JGR
    grid on; box on;
    xlabel('Time after earthquake (min)');
    ylabel('Elevation angle (º)');
    title(['Satellite PRN G', num2str(curr_prn)]);
    
    % Linha do Terremoto
    xline(0, '--r', 'Shock', 'LabelVerticalAlignment', 'bottom');
    
    xlim([-10 90]);
    ylim([0 90]);
    
    % Salva automaticamente para você não ter que fechar 30 janelas
    % saveas(gcf, ['Elevação_PRN_', num2str(curr_prn), '.png']);
end
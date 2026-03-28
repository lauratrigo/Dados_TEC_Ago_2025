clear; 
close all; 
clc;

% 1. CONFIGURAÇÕES
lat_epi = -30.2789; 
lon_epi = -67.4757;     % epicentro
t_quake = 20.7;         % hora decimal do terremoto

% 2. CARREGAR ARQUIVO CONCATENADO
[concatFile, concatPath] = uigetfile({'*.txt;*.mat'},'Selecione o arquivo concatenado');
if isequal(concatFile,0)
    disp('Nenhum arquivo selecionado');
    return
end
concatFile = fullfile(concatPath,concatFile);

opts = detectImportOptions(concatFile,'FileType','text');
T = readtable(concatFile,opts);

disp("Arquivo carregado")

% 3. EXTRAIR COLUNAS
time_utc = T.Time;
ele      = T.Ele;
prn      = T.PRN;

% 4. TEMPO RELATIVO AO TERREMOTO
t_min = (time_utc - t_quake) * 60;

% 5. FILTRO DE TEMPO (igual ao artigo)
idx = (t_min > -10) & (t_min < 90);

t_min = t_min(idx);
ele   = ele(idx);
prn   = prn(idx);

% 6. SATÉLITES ÚNICOS
unique_prns = unique(prn);

% 7. PLOT SEPARADO POR SATÉLITE
for i = 1:length(unique_prns)
    id = prn == unique_prns(i);

    figure('color','w','position',[200 200 800 500])
    plot(t_min(id), ele(id), 'g','LineWidth',1.5)
    
    grid on
    box on
    xlabel('Time after earthquake (min)')
    ylabel('Elevation angle (deg)')
    title(['Satellite PRN ', num2str(unique_prns(i))])
    xlim([-5 90])
    ylim([0 90])
end
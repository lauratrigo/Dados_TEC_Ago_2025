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

% 7. PLOT

figure('color','w','position',[200 200 900 600])
hold on

for i = 1:length(unique_prns)

    id = prn == unique_prns(i);

    plot(t_min(id), ele(id), ...
        'g','LineWidth',1.5)

end

grid on
box on

xlabel('Time after earthquake (min)')
ylabel('Elevation angle (deg)')

title('Satellite Elevation Angles')

xlim([-5 90])
ylim([0 90])

% 8. FILTRAR INTERVALO DO ARTIGO

idx = (t_min > -10) & ...
      (t_min < 90) & ...
      (dist_km < 1200);

t_plot   = t_min(idx);
dist_plot = dist_km(idx);
dtec_plot = dtec(idx);

% 9. PLOT

figure('color','w','position',[200 200 900 600])
hold on

scatter(t_plot,dist_plot,8,dtec_plot,'filled','MarkerFaceAlpha',0.4)

colormap(jet)
caxis([-0.04 0.04])

c = colorbar;
ylabel(c,'dTEC (TECU)')

% 10. LINHAS DE VELOCIDADE

t_line = linspace(0,90,100);

plot(t_line,1.0*60*t_line,'g--','LineWidth',2)
plot(t_line,0.22*60*t_line,'g-','LineWidth',2)

legend('TEC','1.0 km/s','0.22 km/s','location','northwest')

% 11. FORMATAÇÃO

grid on
box on

xlabel('Time after earthquake (min)')
ylabel('Epicentral distance (km)')

title('Travel-Time Diagram - Argentina 2025')

xlim([-5 90])
ylim([0 1200])
clear; close all; clc;

% -------------------------
% Coordenadas [latitude longitude]
% -------------------------
coords = [
    -38.382, -60.274; % 3ARO
    -37.772, -67.716; % 25MA
    -22.722, -65.697; % ABRA
    -34.874, -58.14;  % AGGO
    -27.323, -66.597; % ALUM
    -54.84, -68.604;  % AUTF
    -36.767, -59.881; % AZUL
    -38.964, -61.912; % BATE
    -37.761, -58.301; % BCAR
    -41.147, -71.299; % BCH1
    -41.964, -71.532; % BOLS
    -25.957, -60.622; % CAEP
    -31.602, -68.233; % CFAG
    -27.42, -58.96;   % CHAC
    -39.164, -66.147; % CHIM
    -34.898, -60.019; % CHOY 
    -31.528, -64.47;  % CORD
    -31.981, -68.427; % CSJ1
    -31.981, -68.427; % CSLO
    -30.163, -67.843; % DINO
    -36.315, -57.681; % DORE
    -27.369, -55.892; % EBY1
    -50.336, -72.263; % ECAR
    -42.917, -71.323; % ESQU
    -32.03, -61.225;  % EPGZ
    -31.64, -60.672;  % EPSF
    -30.954, -58.783; % FEDE
    -33.458, -61.487; % FMAT
    -26.191, -58.171; % FOSA
    -33.151, -59.314; % GGUA
    -39.029, -67.577; % GRCA
    -31.869, -59.026; % GUAY
    -35.033, -63.014; % GVIL
    -27.584, -65.623; % JBAL
    -27.003, -64.682; % JVCH
    -25.12, -64.125;  % JVCO
    -34.572, -58.439; % IGM1
    -25.421, -54.588; % ITAI
    -29.415, -66.854; % LARJ
    -38.003, -65.595; % LHCL
    -37.024, -70.752; % LMHS
    -32.475, -61.578; % LROS
    -34.907, -57.932; % LPGS
    -33.722, -62.247; % MGLO
    -31.446, -64.347; % MGNO
    -35.777, -69.398; % MGUE
    -38.006, -57.571; % MPL2 
    -32.895, -68.876; % MZAC
    -33.255, -68.15;  % MZAE
    -32.721, -68.595; % MZAL
    -33.195, -68.467; % MZAR
    -33.736, -69.117; % MZAU
    -34.978, -67.696; % MZGA
    -34.612, -68.331; % MZRF
    -40.105, -64.454; % NESA
    -38.95, -68.06;   % NEQN
    -32.384, -59.795; % NOYA
    -31.509, -68.623; % OAFA
    -29.503, -63.694; % OJOA
    -23.141, -64.325; % ORAN
    -29.714, -57.086; % PACO
    -40.797, -62.989; % PATA
    -38.789, -62.272; % PBCA
    -47.757, -65.899; % PDE3
    -33.946, -60.562; % PEBA
    -35.806, -61.899; % PEJ1
    -39.503, -62.683; % PELU
    -31.781, -60.469; % PRNA
    -27.029, -62.705; % PUMA
    -38.423, -69.211; % PWRO
    -25.286, -57.642; % PY01
    -31.247, -61.471; % RAF1
    -29.274, -65.064; % RCRO
    -30.949, -69.083; % RDCM
    -29.146, -59.664; % RECO
    -53.758, -67.751; % RIO2
    -33.125, -64.349; % RIO4
    -30.209, -69.131; % RODE
    -29.789, -55.769; % RSAL
    -37.384, -68.915; % RSAU
    -28.142, -54.755; % RSCL
    -34.263, -62.71;  % RUFI
    -43.299, -65.107; % RWSN
    -36.23, -66.94;   % SAIS 
    -30.575, -59.929; % SAJA
    -33.15, -70.669;  % SANT
    -45.586, -69.07;  % SARM
    -30.309, -61.227; % SBAL
    -40.583, -67.759; % SICO
    -33.156, -66.314; % SL01
    -40.13, -71.226;  % SMAN
    -29.719, -53.717; % SMAR
    -35.441, -58.804; % SMDM
    -36.621, -64.28;  % SRLP
    -24.846, -54.343; % STHA
    -37.458, -61.931; % SUAR
    -29.141, -62.655; % SUR1
    -26.994, -54.488; % SVIC
    -26.853, -65.71;  % TAVA
    -25.804, -62.831; % TATU
    -27.789, -64.257; % TERO
    -28.067, -67.566; % TGTA
    -23.577, -65.395; % TILC
    -54.488, -67.178; % TOLH
    -23.232, -61.77;  % TOSF
    -26.23, -65.282;  % TRN1
    -26.833, -65.196; % TUC1
    -26.843, -65.23;  % TUCU
    -31.435, -64.194; % UCOR
    -51.648, -69.209; % UNPA
    -32.959, -60.628; % UNRO
    -24.727, -65.408; % UNSA
    -31.541, -68.577; % UNSJ
    -30.254, -57.603; % UYBU
    -34.463, -57.835; % UYCO
    -30.412, -56.491; % UYAR
    -32.291, -58.067; % UYPA
    -32.607, -53.405; % UYRB
    -30.896, -55.559; % UYRI
    -31.375, -57.96;  % UYSA
    -33.261, -58.014; % UYSO
    -30.946, -57.525; % UYTD
    -38.701, -62.269; % VBCA
    -33.228, -60.33;  % VCON
    -37.796, -71.035; % VCOP
    -32.42, -63.241;  % VIMA
    -33.644, -65.448; % VIME
    -22.017, -63.68;  % YCBA
    -24.281, -61.237; % YEMA
    -38.906, -70.067; % ZPLA
];

lat = coords(:,1);
lon = coords(:,2);

% -------------------------
% Nomes das estações
% -------------------------

names = {'3ARO','25MA','ABRA','AGGO','ALUM','AUTF','AZUL','BATE','BCAR','BCH1',...
'BOLS','CAEP','CFAG','CHAC','CHIM','CHOY','CORD','CSJ1','CSLO','DINO','DORE','EBY1',...
'ECAR','ESQU','EPGZ','EPSF','FEDE','FMAT','FOSA','GGUA','GRCA','GUAY','GVIL','JBAL',...
'JVCH','JVCO','IGM1','ITAI','LARJ','LHCL','LMHS','LROS','LPGS','MGLO','MGNO','MGUE',...
'MPL2','MZAC','MZAE','MZAL','MZAR','MZAU','MZGA','MZRF','NESA','NEQN','NOYA','OAFA',...
'OJOA','ORAN','PACO','PATA','PBCA','PDE3','PEBA','PEJ1','PELU','PRNA','PUMA','PWRO',...
'PY01','RAF1','RCRO','RDCM','RECO','RIO2','RIO4','RODE','RSAL','RSAU','RSCL','RUFI',...
'RWSN','SAIS','SAJA','SANT','SARM','SBAL','SICO','SL01','SMAN','SMAR','SMDM','SRLP',...
'STHA','SUAR','SUR1','SVIC','TAVA','TATU','TERO','TGTA','TILC','TOLH','TOSF','TRN1',...
'TUC1','TUCU','UCOR','UNPA','UNRO','UNSA','UNSJ','UYBU','UYCO','UYAR','UYPA','UYRB',...
'UYRI','UYSA','UYSO','UYTD','VBCA','VCON','VCOP','VIMA','VIME','YCBA','YEMA','ZPLA'};

% -------------------------
% REMOÇÃO DE ESTAÇÕES EXTRAS (RS e Uruguai)
% -------------------------

idx_remove = ismember(names, {'ABRA', 'ALUM', 'CHAC', 'CHOY', 'CSLO', 'DINO', 'ECAR', 'EPGZ', 'GGUA', 'JVCH', 'LROS', 'MGNO', 'MGUE', 'MZAU', 'MZGA', 'OJOA', 'RSAL', 'RSAU', 'SANT', 'SUAR', 'TUC1', 'UNSA', 'UYAR', 'UYPA', 'UYSO', 'YEMA'});

lat = coords(:,1);
lon = coords(:,2);

lat(idx_remove) = [];
lon(idx_remove) = [];
names(idx_remove) = [];

% -------------------------
% CARREGAR DADOS E PCA
% -------------------------
n_pca = 3; % Escolha a PCA (Ex: PCA 1 geralmente é o ciclo diário)

matrix_list = readmatrix('matrix_diffTEC_Aug2025_terremoto22.txt');
%matrix_list(isnan(matrix_list)) = 0;

matrix_list(1:135,:) =[];
matrix_list(376:end,:) =[];


matrix_list(:, idx_remove) = [];

% PCA com ALS
%[coeff,score,latent,tsquared,explained] = pca(matrix_list);

[coeff,score,latent,tsquared,explained] = pca(matrix_list,'Algorithm','als','Centered',true);
eof1 = coeff(:,n_pca); 
eof1=eof1/max(eof1);

% -------------------------
% CONFIGURAÇÃO TEMPORAL (1 min)
% -------------------------
Fs = 1/60; % Hz (1 amostra por minuto)

score_analise = score(:, n_pca);

t_minutos = (0:length(score_analise)-1)';

max_lag = 60; % 60 minutos
[autocorr_vals, lags] = xcorr(score_analise - mean(score_analise), max_lag, 'coeff');
lags_min = lags;

[pxx, f] = periodogram(score_analise, rectwin(length(score_analise)), length(score_analise), Fs);

f_ciclos_minuto = f * 60;

subplot(3,1,1)
plot(t_minutos, score_analise)
xlabel('Tempo (Minutos)')

subplot(3,1,2)
plot(lags_min, autocorr_vals)
xlabel('Atraso (Minutos)')

subplot(3,1,3)
semilogx(f_ciclos_minuto, 10*log10(pxx))
xlabel('Frequência (Ciclos por Minuto)')
xlim([0.001 1])
grid on;

% limites do domínio
lat_min = min(lat);
lat_max = max(lat);
lon_min = min(lon);
lon_max = max(lon);

lat_sym1 = lat;
lon_sym1 = lon;
eof_sym1 = eof1;

lat_sym2 = lat;
lon_sym2 = 2*lon_max - lon;
eof_sym2 = eof1;

lat_sym3 = lat;
lon_sym3 = 2*lon_min - lon-10;
eof_sym3 = eof1;

lat_sym4 = 2*lat_max - lat;
lon_sym4 = lon;
eof_sym4 = eof1;

lat_sym5 = 2*lat_min - lat;
lon_sym5 = lon;
eof_sym5 = eof1;

lat_sym6 = 2*lat_max - lat;
lon_sym6 = 2*lon_max - lon;

lat_sym7 = 2*lat_max - lat;
lon_sym7 = 2*lon_min - lon-10;

lat_sym8 = 2*lat_min - lat;
lon_sym8 = 2*lon_max - lon;

lat_sym9 = 2*lat_min - lat;
lon_sym9 = 2*lon_min - lon-10;

lat_all = [lat_sym1;lat_sym2;lat_sym3;lat_sym4;lat_sym5;lat_sym6;lat_sym7;lat_sym8;lat_sym9];
lon_all = [lon_sym1;lon_sym2;lon_sym3;lon_sym4;lon_sym5;lon_sym6;lon_sym7;lon_sym8;lon_sym9];
eof_all = [eof_sym1;eof_sym2;eof_sym3;eof_sym4;eof_sym5;eof_sym1;eof_sym1;eof_sym1;eof_sym1];

% figure
% scatter(lon_all,lat_all,10,'b','filled')
% hold on
% scatter(lon,lat,40,'r','filled')
% grid on
% axis equal
% 
% title('Verificação da simetrização')
% legend('Pontos simetrizados','Estações reais')

% [min(lat_all) max(lat_all)]
% [min(lon_all) max(lon_all)]

%length(lat_all)

% -------------------------
% GRADE DE INTERPOLAÇÃO
% -------------------------
% lon_vec = linspace(min(lon)-5, max(lon)+5, 400);
% lat_vec = linspace(min(lat)-5, max(lat)+5, 400);
% [Lon, Lat] = meshgrid(lon_vec, lat_vec);
% 
% Z = griddata(lon_all, lat_all, eof_all, Lon, Lat, 'natural');

lon_vec = linspace(min(lon_all)-5, max(lon_all)+5, 1000);
lat_vec = linspace(min(lat_all)-5, max(lat_all)+5, 1000);
[Lon, Lat] = meshgrid(lon_vec, lat_vec);

Z = griddata(lon_all, lat_all, eof_all, Lon, Lat, 'natural');

% -------------------------
% PLOT
% -------------------------
figure('Color',[1 1 1]);
contourf(Lon, Lat, Z, 100, 'LineColor','none');
colorbar;
colormap(jet);
hold on;

% Estações reais
scatter(lon, lat, 30, 'k', 'filled');

% --- CONTORNOS DOS PAÍSES ---
% Criamos uma lista com todos os seus arquivos shapefile
shapefiles = {'ar.shp', 'BR_UF_2019.shp', 'cl.shp', 'uy.shp'};

for i = 1:length(shapefiles)
    try
        % Carrega o shapefile atual da lista
        S = shaperead(shapefiles{i}, 'UseGeoCoords', true);
        
        % Plota cada polígono do arquivo
        for k = 1:length(S)
            plot(S(k).Lon, S(k).Lat, 'k', 'LineWidth', 1);
        end
    catch
        fprintf('Aviso: Não foi possível carregar o arquivo %s\n', shapefiles{i});
    end
end

% Limites ajustados para abranger os novos países (ajuste se necessário)
xlim([-76, -50])
ylim([-60, -20])

xlabel('Longitude')
ylabel('Latitude')

title('Mapa Argentina - TEC 2025')
grid on;
% axis equal;
daspect([1 1 1]);

return
save('dados_workspace-terremoto.mat','-v7.3')

% % Permite que você use o scroll do mouse para dar zoom e o clique para arrastar
% pan on; 
% zoom on;
% 
% % Garante que, ao dar zoom, a proporção 1:1 se mantenha
% set(gca, 'DataAspectRatioMode', 'manual', 'PlotBoxAspectRatioMode', 'auto');
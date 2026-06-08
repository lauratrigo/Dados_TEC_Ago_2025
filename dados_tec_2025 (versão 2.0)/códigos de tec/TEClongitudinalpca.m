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

% names = {'3ARO','25MA','ABRA','AGGO','ALUM','AUTF','AZUL','BATE','BCAR','BCH1',...
% 'BOLS','CAEP','CFAG','CHAC','CHIM','CHOY','CORD','CSJ1','CSLO','DINO','DORE','EBY1',...
% 'ECAR','ESQU','EPGZ','EPSF','FEDE','FMAT','FOSA','GGUA','GRCA','GUAY','GVIL','JBAL',...
% 'JVCH','JVCO','IGM1','ITAI','LARJ','LHCL','LMHS','LROS','LPGS','MGLO','MGNO','MGUE',...
% 'MPL2','MZAC','MZAE','MZAL','MZAR','MZAU','MZGA','MZRF','NESA','NEQN','NOYA','OAFA',...
% 'OJOA','ORAN','PACO','PATA','PBCA','PDE3','PEBA','PEJ1','PELU','PRNA','PUMA','PWRO',...
% 'PY01','RAF1','RCRO','RDCM','RECO','RIO2','RIO4','RODE','RSAL','RSAU','RSCL','RUFI',...
% 'RWSN','SAIS','SAJA','SANT','SARM','SBAL','SICO','SL01','SMAN','SMAR','SMDM','SRLP',...
% 'STHA','SUAR','SUR1','SVIC','TAVA','TATU','TERO','TGTA','TILC','TOLH','TOSF','TRN1',...
% 'TUC1','TUCU','UCOR','UNPA','UNRO','UNSA','UNSJ','UYBU','UYCO','UYAR','UYPA','UYRB',...
% 'UYRI','UYSA','UYSO','UYTD','VBCA','VCON','VCOP','VIMA','VIME','YCBA','YEMA','ZPLA'};

names = {'AUTF', 'UNPA', 'SARM', 'SICO', 'GRCA', '25MA', 'SAIS', 'VIME', 'RCRO', 'TERO', 'JVGO', 'ORAN', 'YCBA'};

% -------------------------
% CARREGAR DADOS E PCA
% -------------------------
matrix_list = readmatrix('matrix_diffTECAug2025.txt');

matrix_list(isnan(matrix_list)) = 0;

[coeff,score,latent,tsquared,explained] = pca(matrix_list);

%[coeff,score,latent,tsquared,explained] = pca(matrix_list,'Algorithm','als','Centered',true);

%eof1 = coeff(:,2);

pca1 = score(:,4)*coeff(:,4)';

% stations = {'3ARO','25MA','ABRA','AGGO','ALUM','AUTF','AZUL','BATE','BCAR','BCH1',...
% 'BOLS','CAEP','CFAG','CHAC','CHIM','CHOY','CORD','CSJ1','CSLO','DINO','DORE','EBY1',...
% 'ECAR','ESQU','EPGZ','EPSF','FEDE','FMAT','FOSA','GGUA','GRCA','GUAY','GVIL','JBAL',...
% 'JVCH','JVCO','IGM1','LARJ','LHCL','LMHS','LROS','LPGS','MGLO','MGNO','MGUE',...
% 'MPL2','MZAC','MZAE','MZAL','MZAR','MZAU','MZGA','MZRF','NESA','NEQN','NOYA','OAFA',...
% 'OJOA','ORAN','PACO','PATA','PBCA','PDE3','PEBA','PEJ1','PELU','PRNA','PUMA','PWRO',...
% 'RAF1','RCRO','RDCM','RECO','RIO2','RIO4','RODE','RSAU','RUFI','RWSN','SAIS','SAJA',...
% 'SARM','SBAL','SICO','SL01','SMAN','SMDM','SRLP','STHA','SUAR','SUR1','SVIC',...
% 'TAVA','TATU','TERO','TGTA','TILC','TOLH','TOSF','TRN1','TUC1','TUCU','UCOR','UNPA',...
% 'UNRO','UNSA','UNSJ','VBCA','VCON','VCOP','VIMA','VIME','YCBA','YEMA','ZPLA'};

stations = {'AUTF', 'UNPA', 'SARM', 'SICO', 'GRCA', '25MA', 'SAIS', 'VIME', 'RCRO', 'TERO', 'JVGO', 'ORAN', 'YCBA'};

[lia, idx_num] = ismember(stations, names);

% segurança
idx_num = idx_num(lia);
stations_plot = stations(lia);




names(idx_num)



for i = 1:length(idx_num)


    ind = idx_num(i);   % índice real da estação no vetor original
    
    % -------------------------
    % Extrair dados da estação
    % -------------------------
    vtec_data = pca1(:, ind);
    
        
    % -------------------------
    % Eixo do tempo
    % -------------------------
    time = linspace(datenum(2025,8,1), ...
                    datenum(2025,9,1), ...
                    length(vtec_data));

% Initialize figure
figure(1)
hold on;

% Number of days and hours per day
num_days = 31; % From 12 to 23 of October
hours_per_day = 24; % Hours per day

% Define major ticks
major_ticks = datenum(2025, 8, 1):datenum(2025, 9, 1); % Major ticks from October 12th to 23rd


% Calculate minor ticks: three minor ticks between each major tick
minor_ticks = [];
for k = 1:length(major_ticks)-1
    minor_ticks = [minor_ticks, linspace(major_ticks(k), major_ticks(k+1), 5)]; % Divide each day into 4 (3 intervals)
end
minor_ticks = setdiff(minor_ticks, major_ticks); % Remove the major ticks to keep only minor


             
             
    % Define the time axis
    time = linspace(datenum(2025,8,1), datenum(2025,9,1), length(vtec_data));
    
    if i~=length(idx_num)
    figure(1)
    % Create subplot for the current station
    subplot(length(idx_num), 1, i);
    % Plot PC% VTEC
    
    
    plot(time, vtec_data, 'b.-');
    
    xlim([time(1) time(end)])   % ? remove bordas brancas

    ylim([-10 10])
    
    % Set minor ticks on the x-axis
    ax = gca;
    ax.YColor = 'k';
    hold on;
   
    ylabel(sprintf('%s\n\\Delta VTEC', stations_plot{i}));
    
   %ylim([-20,20])
    % Set x-axis ticks and labels
    xticks(major_ticks);
    xticklabels([]);
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = minor_ticks;
    
    
    else
         
      figure (1)
    % Create subplot for the current station
    subplot(length(idx_num), 1, i);
    % Plot differences for h'F
    
     
     plot(time, vtec_data, 'b.-');
     
     xlim([time(1) time(end)])   % ? remove bordas brancas
    
    % Set minor ticks on the x-axis
    ax = gca;
    ax.YColor = 'k';
    hold on;
    % Set plot titles and labels
    %title([stations{i}]);
    %ylabel('\Delta VTEC');
    ylabel(sprintf('%s\n\\Delta VTEC', stations{i}));
    
    ylim([-10,10])
    % Set x-axis ticks and labels
    xticks(major_ticks);
    xticklabels(datestr(major_ticks, 'dd-mmm'));
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = minor_ticks;
    
    
    
    end

%writematrix(matrix_diffTEC,'matrix_diffTECAug2011.txt','Delimiter', ' ')
 
end


figure1=figure(1)


% Create rectangle
annotation(figure1,'rectangle',...
    [0.280687499999998 0.110236220472444 0.0245208333333354 0.813273340832406],...
    'Color',[0 0 1],...
    'FaceColor',[0.729411780834198 0.831372559070587 0.95686274766922],...
    'FaceAlpha',0.2);

% Create rectangle
annotation(figure1,'rectangle',...
    [0.505687499999998 0.110236220472444 0.0245208333333351 0.813273340832406],...
    'Color',[0 0 1],...
    'FaceColor',[0.729411780834198 0.831372559070587 0.95686274766922],...
    'FaceAlpha',0.2);

% Create rectangle
annotation(figure1,'rectangle',...
    [0.530687499999998 0.110236220472444 0.0245208333333354 0.813273340832406],...
    'Color',[0 0 1],...
    'FaceColor',[0.729411780834198 0.831372559070587 0.95686274766922],...
    'FaceAlpha',0.2);

% Create rectangle
annotation(figure1,'rectangle',...
    [0.805166666666664 0.110236220472444 0.0245208333333354 0.813273340832406],...
    'Color',[0 0 1],...
    'FaceColor',[0.729411780834198 0.831372559070587 0.95686274766922],...
    'FaceAlpha',0.2);

% Create line
annotation(figure1,'line',[0.658854166666666 0.659374999999999],...
    [0.110063322966984 0.926586382584532],'LineWidth',2,'LineStyle','--');

% Create rectangle
annotation(figure1,'rectangle',...
    [0.579645833333331 0.110236220472444 0.0255624999999999 0.813273340832406],...
    'Color',[1 0 0],...
    'FaceColor',[1 0 0],...
    'FaceAlpha',0.1);

% Create rectangle
annotation(figure1,'rectangle',...
    [0.255687499999998 0.110236220472444 0.0245208333333354 0.813273340832406],...
    'Color',[0 0 1],...
    'FaceColor',[0.729411780834198 0.831372559070587 0.95686274766922],...
    'FaceAlpha',0.2);

% Create rectangle
annotation(figure1,'rectangle',...
    [0.380166666666665 0.110236220472444 0.0255624999999997 0.813273340832406],...
    'Color',[1 0 0],...
    'FaceColor',[1 0 0],...
    'FaceAlpha',0.1);

% Create rectangle
annotation(figure1,'rectangle',...
    [0.305166666666665 0.110236220472444 0.0255624999999997 0.813273340832406],...
    'Color',[1 0 0],...
    'FaceColor',[1 0 0],...
    'FaceAlpha',0.1);

% Create rectangle
annotation(figure1,'rectangle',...
    [0.355729166666667 0.110236220472444 0.0244791666666667 0.813273340832406],...
    'Color',[1 0 0],...
    'FaceColor',[1 0 0],...
    'FaceAlpha',0.1);

% Create rectangle
annotation(figure1,'rectangle',...
    [0.330687499999999 0.110236220472444 0.0250416666666681 0.813273340832406],...
    'Color',[1 0 0],...
    'FaceColor',[1 0 0],...
    'FaceAlpha',0.1);
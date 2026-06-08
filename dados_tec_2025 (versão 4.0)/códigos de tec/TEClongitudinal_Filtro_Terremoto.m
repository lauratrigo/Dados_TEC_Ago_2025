clear all 
close all
clc

% 1
 %files = {'TOLH-2025-08(01-31).txt','AUTF-2025-08(01-31).txt', 'RIO2-2025-08(01-31).txt', 'UNPA-2025-08(01-31).txt', 'PDE3-2025-08(01-31).txt', 'SARM-2025-08(01-31).txt', 'RWSN-2025-08(01-31).txt'};
 %stations = {'TOLH', 'AUTF', 'RIO2', 'UNPA', 'PDE3', 'SARM', 'RWSN'};

% 2
% files = {'AUTF-2025-08(01-31).txt', 'RIO2-2025-08(01-31).txt', 'ESQU-2025-08(01-31).txt', 'BOLS-2025-08(01-31).txt', 'PATA-2025-08(01-31).txt', 'BCH1-2025-08(01-31).txt'};
% stations = {'AUTF', 'RIO2', 'ESQU', 'BOLS', 'PATA', 'BCH1'};

% 3
%files = {'TOLH-2025-08(01-31).txt','AUTF-2025-08(01-31).txt', 'RIO2-2025-08(01-31).txt','UNPA-2025-08(01-31).txt', 'ESQU-2025-08(01-31).txt', 'BOLS-2025-08(01-31).txt', 'SICO-2025-08(01-31).txt', 'NESA-2025-08(01-31).txt'};
%stations = {'TOLH','AUTF', 'RIO2','UNPA', 'ESQU', 'BOLS', 'SICO', 'NESA'};

files = {'TOLH-2025-08(01-31).txt','AUTF-2025-08(01-31).txt', 'PDE3-2025-08(01-31).txt',  'RWSN-2025-08(01-31).txt', 'ESQU-2025-08(01-31).txt'};
stations = {'TOLH', 'AUTF',  'PDE3',  'RWSN', 'ESQU'};

figure;
hold on;

% =========================
% INTERVALO DE TEMPO
% =========================

 t_inicio = datenum(2025,8,1,0,0,0);   % 22 Aug 02:16
 t_fim    = datenum(2025,9,1,0,0,0);   % 22 Aug 06:16

 t_inicio1 = datenum(2025,8,22,2,10,0);   % 22 Aug 02:16
 t_fim1    = datenum(2025,8,22,4,0,0);   % 22 Aug 06:16

num_days = 31; 
hours_per_day = 24; 

major_ticks = t_inicio:t_fim;

    minor_ticks = [];
    for k = 1:length(major_ticks)-1
        minor_ticks = [minor_ticks, linspace(major_ticks(k), major_ticks(k+1), 5)];
    end
    minor_ticks = setdiff(minor_ticks, major_ticks);
    
figure(1)
figure(2)

for i = 1:length(files)
    % Read data as text, skipping the first line
    fid = fopen(files{i}, 'rt');
    raw_data = textscan(fid, '%s', 'Delimiter', '\n', 'HeaderLines', 1);
    fclose(fid);
    
    % Convert commas to dots for decimal points
    for j = 1:length(raw_data{1})
        raw_data{1}{j} = strrep(raw_data{1}{j}, ',', '.');
    end
    
    % Convert '-999.0' to NaN
    for j = 1:length(raw_data{1})
        raw_data{1}{j} = strrep(raw_data{1}{j}, '-999.0', 'NaN');
    end
    
    % Convert text data to numeric data
    data = cellfun(@(x) str2num(x), raw_data{1}, 'UniformOutput', false);
    data = cell2mat(data);
    
    % Extract relevant data
    media = data(:, 1); % Media (Average)
    [N, M] = size(media);
    media = repmat(media, num_days, 1);
    
    media=movmean(media,360,'omitnan');

    
    med_plus = data(:, 2); % Median + Deviation
    [N, M] = size(med_plus);

    % Replace NaNs in med_plus
    for j = 1:N
        if isnan(med_plus(j, 1))
            med_plus(j, 1) = media(j+1, 1);
            disp('NaN value replaced with media value');
        end
    end

    med_plus = repmat(med_plus, num_days, 1);
    med_minus = data(:, 3); % Median - Deviation
    [N, M] = size(med_minus);
    
    for j = 1:N
        if isnan(med_minus(j, 1))
            med_minus(j, 1) = media(j+1, 1);
            disp('NaN value replaced with media value');
        end
    end

    med_minus = repmat(med_minus, num_days, 1);
    
    % Reshape VTEC data to 24 hours format
    vtec_data = data(:, 5:2:end); % VTEC data every 2 columns starting from column 5
    [N, M] = size(vtec_data)
    
   
    
    vtec_data = [vtec_data(:,1); vtec_data(:,2); vtec_data(:,3); vtec_data(:,4); vtec_data(:,5); vtec_data(:,6);vtec_data(:,7); vtec_data(:,8); vtec_data(:,9); vtec_data(:,10);...
                 vtec_data(:,11); vtec_data(:,12); vtec_data(:,13); vtec_data(:,14); vtec_data(:,15); vtec_data(:,16);vtec_data(:,17); vtec_data(:,18); vtec_data(:,19); vtec_data(:,20);...
                 vtec_data(:,21); vtec_data(:,22); vtec_data(:,23); vtec_data(:,24); vtec_data(:,25); vtec_data(:,26);vtec_data(:,27); vtec_data(:,28); vtec_data(:,29); vtec_data(:,30);...
                 vtec_data(:,31)];
             
      % 1. Crie o eixo de tempo real do mês inteiro (do dia 1 ao 31)
     %time = linspace(datenum(2025,8,22,0,0,0), datenum(2025,8,31,23,59,0), length(vtec_data));

    time = linspace(t_inicio, t_fim, length(vtec_data));

  


    figure (1)
    if i~=length(files)
    % Create subplot for the current station
    
    subplot(length(files), 1, i);
    
    xlim([time(1) time(end)])
    axis tight
    
    % Plot median data with deviation as filled area
    grayColor = [0.7, 0.7, 0.7];  % Light gray
    fill([time, fliplr(time)], [med_plus', fliplr(med_minus')], grayColor, 'EdgeColor', 'none');
    hold on;
    plot(time, vtec_data, 'b', 'LineWidth', 2);
    plot(time, media, 'k', 'LineWidth', 2);
    
    xlim([time(1) time(end)])
    axis tight
    
    % Set plot titles and labels
    %title([stations{i}]);
    %ylabel('VTEC');
    ylabel([stations{i};'VTEC'])
    
    % Set x-axis ticks and labels
%     xticks(major_ticks);
%     xticklabels([]);

    xticks(linspace(t_inicio,t_fim,32))
    xticklabels(datestr(linspace(t_inicio,t_fim,32),'DD-08'))
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = minor_ticks;
    
    
    
    figure(2)
    % Create subplot for the current station
    subplot(length(files), 1, i);
    
    % ==============================
    % MÉDIA CORRIDA 16 PONTOS
    % ==============================
    janela_longa = 16;   % 16 minutos
    media_longa = movmean(vtec_data, janela_longa, 'omitnan');

    % Se quiser manter a banda tipo 2–10 mHz,
    % mantenha uma janela curta pequena
    janela_curta = 4;    % 3 minutos
    media_curta = movmean(vtec_data, janela_curta, 'omitnan');

    % Residual tipo passa-banda aproximado
    dTEC = media_curta - media_longa;
    
      % 2. Identifique os índices que caem exatamente entre 02:16 e 06:16 do dia 22
    idx_evento = (time >= t_inicio1) & (time <= t_fim1);
    
    
    idx_evento2 =find(idx_evento==1) 
    return

    % 3. Na hora de plotar, use apenas esses índices
     plot(time(idx_evento), dTEC(idx_evento), 'b', 'LineWidth', 2);
% 
%     % 4. Ajuste o xlim para garantir que o gráfico foque no recorte
     xlim([t_inicio1 t_fim1]);
    datetick('x', 'HH:MM', 'keepticks', 'keeplimits');
    
   ylabel(sprintf('%s\n\\Delta VTEC', stations{i}));
    
       
    else
    subplot(length(files), 1, i);
    
    xlim([time(1) time(end)])
    axis tight
    
    % Plot median data with deviation as filled area
    grayColor = [0.7, 0.7, 0.7];  % Light gray
    fill([time, fliplr(time)], [med_plus', fliplr(med_minus')], grayColor, 'EdgeColor', 'none');
    hold on;
    plot(time, vtec_data, 'b', 'LineWidth', 2);
    plot(time, media, 'k', 'LineWidth', 2);
    
    xlim([time(1) time(end)])
    axis tight
    
    % Set plot titles and labels
    
    ylabel([stations{i};'VTEC'])
    
   

   xticks(linspace(t_inicio,t_fim,32))
    xticklabels(datestr(linspace(t_inicio,t_fim,32),'DD-08'))
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = minor_ticks;
    
    hold on;
    
    %calculo das médias noturnas
   % NoiteTEC = mean(abs(media(181:361,1)));
    %NoiteTEC = mean(abs(media(181,1)));
    
     figure (2)
    % Create subplot for the current station
    subplot(length(files), 1, i);
    % Plot differences for h'F
    
    % ==============================
    % MÉDIA CORRIDA 16 PONTOS
    % ==============================
    %janela_longa = 16;   % 16 minutos
    media_longa = movmean(vtec_data, janela_longa, 'omitnan');

    % Se quiser manter a banda tipo 2–10 mHz,
    % mantenha uma janela curta pequena
    %janela_curta = 4;    % 3 minutos
    media_curta = movmean(vtec_data, janela_curta, 'omitnan');

    % Residual tipo passa-banda aproximado
    dTEC = media_curta - media_longa;
    
    
      % 2. Identifique os índices que caem exatamente entre 02:16 e 06:16 do dia 22
    idx_evento = (time >= t_inicio1) & (time <= t_fim1);

    % 3. Na hora de plotar, use apenas esses índices
     plot(time(idx_evento), dTEC(idx_evento), 'b', 'LineWidth', 2);
% 
%     % 4. Ajuste o xlim para garantir que o gráfico foque no recorte
     xlim([t_inicio1 t_fim1]);
    datetick('x', 'HH:MM', 'keepticks', 'keeplimits');
    ylabel(sprintf('%s\n\\Delta VTEC', stations{i}));
    
    
    end
end


%writematrix(matrix_diffTEC,'matrix_diffTECAug2011.txt','Delimiter', ' ')
 
figure1=figure(2)
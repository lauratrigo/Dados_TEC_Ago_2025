clear all 
close all
clc

% List of files corresponding to each station
% files = {'FORT-2011-08(01-31).txt' };
% stations = {'FORT'};

% files = {'IMPZ-2003-10(12-23).txt','FORT-2003-10(12-23).txt', 'CUIB-2003-10(12-23).txt', 'CRAT-2003-10(12-23).txt' };
% stations = {'IMPZ','FORT','CUIB','CRAT'};

%1º teste
files = {'AUTF-2025-08(01-31).txt', 'UNPA-2025-08(01-31).txt', 'SARM-2025-08(01-31).txt', 'SICO-2025-08(01-31).txt', 'GRCA-2025-08(01-31).txt', '25MA-2025-08(01-31).txt', 'SAIS-2025-08(01-31).txt', 'LARJ-2025-08(01-31).txt', 'JBAL-2025-08(01-31).txt', 'ORAN-2025-08(01-31).txt'};
stations = {'AUTF', 'UNPA', 'SARM', 'SICO', 'GRCA', '25MA', 'SAIS', 'LARJ', 'JBAL', 'ORAN'};


%2º teste
%  files = {'POVE-2011-08(01-31).txt', 'CUIB-2011-08(01-31).txt', 'GOJA-2011-08(01-31).txt', 'BRAZ-2011-08(01-31).txt', 'MSCG-2011-08(01-31).txt', 'ILHA-2011-08(01-31).txt', 'SPAR-2011-08(01-31).txt', 'TOPL-2011-08(01-31).txt', 'MTSF-2011-08(01-31).txt', 'TOGU-2011-08(01-31).txt'};
%  stations = {'POVE', 'CUIB', 'GOJA', 'BRAZ', 'MSCG', 'ILHA', 'SPAR', 'PPTE', 'SJRP', 'TOPL', 'MTSF', 'TOGU'};

% Initialize figure
figure;
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

% Loop through each station and file
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
    
    % Replace NaNs in med_minus
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
             
             
    % Define the time axis
    time = linspace(datenum(2025,8,1), datenum(2025,9,1), length(vtec_data));
    
    figure (1)
    if i~=length(files)
    % Create subplot for the current station
    
    subplot(length(files), 1, i);
    
    % Plot median data with deviation as filled area
    grayColor = [0.7, 0.7, 0.7];  % Light gray
    fill([time, fliplr(time)], [med_plus', fliplr(med_minus')], grayColor, 'EdgeColor', 'none');
    hold on;
    plot(time, vtec_data, 'b', 'LineWidth', 2);
    plot(time, media, 'k', 'LineWidth', 2);
    
    % Set plot titles and labels
    %title([stations{i}]);
    %ylabel('VTEC');
    ylabel([stations{i};'VTEC'])
    
    % Set x-axis ticks and labels
    xticks(major_ticks);
    xticklabels([]);
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = minor_ticks;
    
    hold on;
    
    %calculo das médias noturnas
    NoiteTEC = mean(abs(media(181:361,1)));
    %NoiteTEC = mean(abs(media(181,1)));
    
    figure(2)
    % Create subplot for the current station
    subplot(length(files), 1, i);
    % Plot differences for h'F
    yyaxis left;
    diff_TEC = vtec_data - media;
    matrix_diffTEC(:,i)=diff_TEC;
    plot(time, diff_TEC, 'b.-');
    
    % Set minor ticks on the x-axis
    ax = gca;
    ax.YColor = 'k';
    hold on;
    % Set plot titles and labels
    %title([stations{i}]);
    %ylabel('\Delta VTEC');
    ylabel(sprintf('%s\n\\Delta VTEC', stations{i}));
    
    ylim([-20,20])
    % Set x-axis ticks and labels
    xticks(major_ticks);
    xticklabels([]);
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = minor_ticks;
    
    
    yyaxis right;
    diff_hF = vtec_data - media;
    diff_std = (med_plus-med_minus)/2;

    for i = 1:length(diff_hF)
        if diff_hF(i,:) > diff_std(i,:)
            diff_hF(i,:) = diff_hF(i,:) - diff_std(i,:);
        elseif diff_hF(i,:) < -diff_std(i,:)
            diff_hF(i,:) = diff_hF(i,:) + diff_std(i,:);
        else
            diff_hF(i,:) = 0;    
        end
    end

    diff_hF = (diff_hF / NoiteTEC ) * 100;
    bar(time, diff_hF, 'FaceColor', 'g', 'FaceAlpha', 0.5);
    ylim([-200,200])
    
    % Set minor ticks on the x-axis
    ax = gca;
    ax.YColor = 'k';
    hold on;
    
    ylabel('Index');
    % Set x-axis ticks and labels
    xticks(major_ticks);
    xticklabels([]);
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = minor_ticks;
    else
        % Create subplot for the current station
    subplot(length(files), 1, i);
    
    % Plot median data with deviation as filled area
    grayColor = [0.7, 0.7, 0.7];  % Light gray
    fill([time, fliplr(time)], [med_plus', fliplr(med_minus')], grayColor, 'EdgeColor', 'none');
    hold on;
    plot(time, vtec_data, 'b', 'LineWidth', 2);
    plot(time, media, 'k', 'LineWidth', 2);
    
    % Set plot titles and labels
    %title([stations{i}]);
    %ylabel('VTEC');
    ylabel([stations{i};'VTEC'])
    
    % Set x-axis ticks and labels
    xticks(major_ticks);
    xticklabels(datestr(major_ticks, 'dd-mmm'));
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = minor_ticks;
    
    hold on;
    
    %calculo das médias noturnas
    NoiteTEC = mean(abs(media(181:361,1)));
    %NoiteTEC = mean(abs(media(181,1)));
    
     figure (2)
    % Create subplot for the current station
    subplot(length(files), 1, i);
    % Plot differences for h'F
    yyaxis left;
     
    diff_TEC = vtec_data - media;
    
    matrix_diffTEC(:,i)=diff_TEC;
    plot(time, diff_TEC, 'b.-');
    
    % Set minor ticks on the x-axis
    ax = gca;
    ax.YColor = 'k';
    hold on;
    % Set plot titles and labels
    %title([stations{i}]);
    %ylabel('\Delta VTEC');
    ylabel(sprintf('%s\n\\Delta VTEC', stations{i}));
    
    ylim([-20,20])
    % Set x-axis ticks and labels
    xticks(major_ticks);
    xticklabels(datestr(major_ticks, 'dd-mmm'));
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = minor_ticks;
    
    
    yyaxis right;
    diff_hF = vtec_data - media;
    diff_std = (med_plus-med_minus)/2;

    for i = 1:length(diff_hF)
        if diff_hF(i,:) > diff_std(i,:)
            diff_hF(i,:) = diff_hF(i,:) - diff_std(i,:);
        elseif diff_hF(i,:) < -diff_std(i,:)
            diff_hF(i,:) = diff_hF(i,:) + diff_std(i,:);
        else
            diff_hF(i,:) = 0;    
        end
    end

    diff_hF = (diff_hF / NoiteTEC ) * 100;
    bar(time, diff_hF, 'FaceColor', 'g', 'FaceAlpha', 0.5);
    ylim([-200,200])
    
    % Set minor ticks on the x-axis
    ax = gca;
    ax.YColor = 'k';
    hold on;
    
    ylabel('Index');
    % Set x-axis ticks and labels
    xticks(major_ticks);
    xticklabels(datestr(major_ticks, 'dd-mmm'));
    ax = gca;
    ax.XAxis.MinorTick = 'on';
    ax.XAxis.MinorTickValues = minor_ticks;
    end
end


%writematrix(matrix_diffTEC,'matrix_diffTECAug2011.txt','Delimiter', ' ')
 
figure1=figure(2)

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



clear all
close all
clc

% =========================================================================
% LISTA DE ARQUIVOS (estações)
% =========================================================================

% lista com todos os arquivos .txt de cada estação de GNSS
files = {'3ARO-2025-08(01-31).txt','25MA-2025-08(01-31).txt','ABRA-2025-08(01-31).txt','AGGO-2025-08(01-31).txt','ALUM-2025-08(01-31).txt',...
'AUTF-2025-08(01-31).txt','AZUL-2025-08(01-31).txt','BATE-2025-08(01-31).txt','BCAR-2025-08(01-31).txt','BCH1-2025-08(01-31).txt',...
'BOLS-2025-08(01-31).txt','CAEP-2025-08(01-31).txt','CFAG-2025-08(01-31).txt','CHAC-2025-08(01-31).txt','CHIM-2025-08(01-31).txt',...
'CHOY-2025-08(01-31).txt','CORD-2025-08(01-31).txt','CSJ1-2025-08(01-31).txt','CSLO-2025-08(01-31).txt','DINO-2025-08(01-31).txt',...
'DORE-2025-08(01-31).txt','EBY1-2025-08(01-31).txt','ECAR-2025-08(01-31).txt','ESQU-2025-08(01-31).txt','EPGZ-2025-08(01-31).txt',...
'EPSF-2025-08(01-31).txt','FEDE-2025-08(01-31).txt','FMAT-2025-08(01-31).txt','FOSA-2025-08(01-31).txt','GGUA-2025-08(01-31).txt',...
'GRCA-2025-08(01-31).txt','GUAY-2025-08(01-31).txt','GVIL-2025-08(01-31).txt','JBAL-2025-08(01-31).txt','JVCH-2025-08(01-31).txt',...
'JVGO-2025-08(01-31).txt','IGM1-2025-08(01-31).txt','ITAI-2025-08(01-31).txt','LARJ-2025-08(01-31).txt','LHCL-2025-08(01-31).txt',...
'LMHS-2025-08(01-31).txt','LROS-2025-08(01-31).txt','LPGS-2025-08(01-31).txt','MGLO-2025-08(01-31).txt','MGNO-2025-08(01-31).txt',...
'MGUE-2025-08(01-31).txt','MPL2-2025-08(01-31).txt','MZAC-2025-08(01-31).txt','MZAE-2025-08(01-31).txt','MZAL-2025-08(01-31).txt',...
'MZAR-2025-08(01-31).txt','MZAU-2025-08(01-31).txt','MZGA-2025-08(01-31).txt','MZRF-2025-08(01-31).txt','NESA-2025-08(01-31).txt',...
'NEQN-2025-08(01-31).txt','NOYA-2025-08(01-31).txt','OAFA-2025-08(01-31).txt','OJOA-2025-08(01-31).txt','ORAN-2025-08(01-31).txt',...
'PACO-2025-08(01-31).txt','PATA-2025-08(01-31).txt','PBCA-2025-08(01-31).txt','PDE3-2025-08(01-31).txt','PEBA-2025-08(01-31).txt',...
'PEJ1-2025-08(01-31).txt','PELU-2025-08(01-31).txt','PRNA-2025-08(01-31).txt','PUMA-2025-08(01-31).txt','PWRO-2025-08(01-31).txt',...
'PY01-2025-08(01-31).txt','RAF1-2025-08(01-31).txt','RCRO-2025-08(01-31).txt','RDCM-2025-08(01-31).txt','RECO-2025-08(01-31).txt',...
'RIO2-2025-08(01-31).txt','RIO4-2025-08(01-31).txt','RODE-2025-08(01-31).txt','RSAL-2025-08(01-31).txt','RSAU-2025-08(01-31).txt',...
'RSCL-2025-08(01-31).txt','RUFI-2025-08(01-31).txt','RWSN-2025-08(01-31).txt','SAIS-2025-08(01-31).txt','SAJA-2025-08(01-31).txt',...
'SANT-2025-08(01-31).txt','SARM-2025-08(01-31).txt','SBAL-2025-08(01-31).txt','SICO-2025-08(01-31).txt','SL01-2025-08(01-31).txt',...
'SMAN-2025-08(01-31).txt','SMAR-2025-08(01-31).txt','SMDM-2025-08(01-31).txt','SRLP-2025-08(01-31).txt','STHA-2025-08(01-31).txt',...
'SUAR-2025-08(01-31).txt','SUR1-2025-08(01-31).txt','SVIC-2025-08(01-31).txt','TAVA-2025-08(01-31).txt','TATU-2025-08(01-31).txt',...
'TERO-2025-08(01-31).txt','TGTA-2025-08(01-31).txt','TILC-2025-08(01-31).txt','TOLH-2025-08(01-31).txt','TOSF-2025-08(01-31).txt',...
'TRN1-2025-08(01-31).txt','TUC1-2025-08(01-31).txt','TUCU-2025-08(01-31).txt','UCOR-2025-08(01-31).txt','UNPA-2025-08(01-31).txt',...
'UNRO-2025-08(01-31).txt','UNSA-2025-08(01-31).txt','UNSJ-2025-08(01-31).txt','UYBU-2025-08(01-31).txt','UYCO-2025-08(01-31).txt',...
'UYAR-2025-08(01-31).txt','UYPA-2025-08(01-31).txt','UYRB-2025-08(01-31).txt','UYRI-2025-08(01-31).txt','UYSA-2025-08(01-31).txt',...
'UYSO-2025-08(01-31).txt','UYTD-2025-08(01-31).txt','VBCA-2025-08(01-31).txt','VCON-2025-08(01-31).txt','VCOP-2025-08(01-31).txt',...
'VIMA-2025-08(01-31).txt','VIME-2025-08(01-31).txt','YCBA-2025-08(01-31).txt','YEMA-2025-08(01-31).txt','ZPLA-2025-08(01-31).txt'};

% nome das estações de cada um dos arquivos que estão sendo importados (tem que escrever o nome das estações aqui na mesma ordem que os arquivos estão sendo importados)
stations = {'3ARO','25MA','ABRA','AGGO','ALUM','AUTF','AZUL','BATE','BCAR','BCH1',...
'BOLS','CAEP','CFAG','CHAC','CHIM','CHOY','CORD','CSJ1','CSLO','DINO','DORE','EBY1',...
'ECAR','ESQU','EPGZ','EPSF','FEDE','FMAT','FOSA','GGUA','GRCA','GUAY','GVIL','JBAL',...
'JVCH','JVGO','IGM1','ITAI','LARJ','LHCL','LMHS','LROS','LPGS','MGLO','MGNO','MGUE',...
'MPL2','MZAC','MZAE','MZAL','MZAR','MZAU','MZGA','MZRF','NESA','NEQN','NOYA','OAFA',...
'OJOA','ORAN','PACO','PATA','PBCA','PDE3','PEBA','PEJ1','PELU','PRNA','PUMA','PWRO',...
'PY01','RAF1','RCRO','RDCM','RECO','RIO2','RIO4','RODE','RSAL','RSAU','RSCL','RUFI',...
'RWSN','SAIS','SAJA','SANT','SARM','SBAL','SICO','SL01','SMAN','SMAR','SMDM','SRLP',...
'STHA','SUAR','SUR1','SVIC','TAVA','TATU','TERO','TGTA','TILC','TOLH','TOSF','TRN1',...
'TUC1','TUCU','UCOR','UNPA','UNRO','UNSA','UNSJ','UYBU','UYCO','UYAR','UYPA','UYRB',...
'UYRI','UYSA','UYSO','UYTD','VBCA','VCON','VCOP','VIMA','VIME','YCBA','YEMA','ZPLA'};

% =========================================================================
% 2. CONFIGURAÇÕES DOS DIAS
% =========================================================================

dias_escolhidos = [22]; % número de dias no mês escolhido para análise (nesse caso, agosto de 2025)
horas_por_dia = 1440; % 1440 pontos em um dia, porque é um dado por minuto (60 x 24)

% =========================================================================
% LOOP PRINCIPAL (processa cada estação)
% =========================================================================

for i = 1:length(files)
    
    fid = fopen(files{i}, 'rt');  % abre arquivo por arquivo
    fprintf('Processando arquivo %d de %d: %s\n', i, length(files), files{i});

    % verifica se o arquivo existe
    if ~isfile(files{i})
        fprintf('Arquivo faltando: %s\n', files{i});
        continue
    end

    % verifica se abriu corretamente
    if fid == -1
        fprintf('Erro ao abrir: %s\n', files{i});
        continue
    end

    % agora sim lê o arquivo
    raw_data = textscan(fid, '%s', 'Delimiter', '\n', 'HeaderLines', 1);
    fclose(fid);
    
    % ---------------------------------------------------------------------
    % TRATAMENTO DOS DADOS
    % ---------------------------------------------------------------------

    % troca as vírgulas por pontos e substituí valores inválidos por NaN
    for j = 1:length(raw_data{1})
        raw_data{1}{j} = strrep(raw_data{1}{j}, ',', '.');
        raw_data{1}{j} = strrep(raw_data{1}{j}, '-999.0', 'NaN');
    end

    % converte texto para número
    data = cellfun(@str2num, raw_data{1}, 'UniformOutput', false);
    data = cell2mat(data);

    % ---------------------------------------------------------------------
    % EXTRAÇÃO DAS VARIÁVEIS
    % ---------------------------------------------------------------------
    
    media = data(:,1); % a coluna 1 é a da média
    
    

    vtec_data = data(:,5:2:end);  % pega as colunas de VTEC (entre os dias 1 a 31, e pulando de 2 em 2, porque uma coluna é de hora, e a outra é de TEC)
    
    % expande a média para bater com o tamanho dos 31 dias
    media_expand = repmat(media, 31, 1);
    
    media_expand=movmean(media_expand,360, 'omitnan');

    % lineariza os 31 dias (transforma a matriz em um vetor coluna longo)
    % usa vtec_cols' (transposta) garante que o reshape siga a ordem dos dias corretamente
    vtec_data = [vtec_data(:,1); vtec_data(:,2); vtec_data(:,3); vtec_data(:,4); vtec_data(:,5); vtec_data(:,6);vtec_data(:,7); vtec_data(:,8); vtec_data(:,9); vtec_data(:,10);...
                 vtec_data(:,11); vtec_data(:,12); vtec_data(:,13); vtec_data(:,14); vtec_data(:,15); vtec_data(:,16);vtec_data(:,17); vtec_data(:,18); vtec_data(:,19); vtec_data(:,20);...
                 vtec_data(:,21); vtec_data(:,22); vtec_data(:,23); vtec_data(:,24); vtec_data(:,25); vtec_data(:,26);vtec_data(:,27); vtec_data(:,28); vtec_data(:,29); vtec_data(:,30);...
                 vtec_data(:,31)];


    % ===============================
    % CÁLCULO PRINCIPAL
    % ===============================
    diff_TEC = vtec_data - media_expand;
    
%     plot(vtec_data) % esse plot é apenas para verificar se o código está funcionando corretamente (porque se colocar reshape no vtec_data, dá errado)
%     return
    
    % extração dos dias escolhidos
    idx_final = [];

    % esse for vai calcular os índices do dia escolhido (nesse caso, o dia 22, por exemplo)
    for d = dias_escolhidos
        inicio = (d-1)*horas_por_dia + 1;
        fim = d*horas_por_dia;
        idx_final = [idx_final inicio:fim];
    end

    diff_TEC_selecionado = diff_TEC(idx_final);

    teste(:,i) = diff_TEC_selecionado;
end

% ===============================
% SALVAR
% ===============================

% cria uma pasta no caminho indicado para o usuário, caso ela ainda não exista
output_folder = 'C:\Users\vikla\Downloads\dados_tec_2025\formatado';

if ~exist(output_folder, 'dir')
    mkdir(output_folder);
end

% salva a matriz final em .txt
output_file = fullfile(output_folder, 'matrix_diffTEC_Aug2025_terremoto.txt');
writematrix(teste, output_file, 'Delimiter',' ');

disp('Processamento finalizado com sucesso!')

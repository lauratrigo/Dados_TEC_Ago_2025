clear all 
close all
clc

stations = {'3ARO','25MA','ABRA','AGGO','ALUM','AUTF','AZUL','BATE','BCAR','BCH1',...
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

matrix_list = readmatrix('matrix_diffTEC_Aug2025_dias_perturbados.txt');


% 2. Configurações
limiar =25; % Porcentagem máxima de NaNs permitida
estacoes_ruins = {}; % Para guardar os nomes

fprintf('--- Iniciando Auditoria de Dados (Limiar: %d%%) ---\n', limiar);
[N,M]=size(matrix_list);
total_nan=sum(isnan(matrix_list));

for i = 1:M
    
    
    % Cálculo da porcentagem de NaN
        porcentagem_nan = (total_nan(:,i) / N) * 100;
    
          
    % Se passar do limite, avisar
    if porcentagem_nan > limiar
        fprintf('ESTAÇÃO: %s | %.2f%% de NaNs -> [REMOVER]\n', stations{i}, porcentagem_nan);
        estacoes_ruins{end+1} = stations{i};
    end
end



% 3. Print final para facilitar sua vida
fprintf('\n--- Resumo para o seu script de PCA ---\n');
fprintf('Copie esta lista para o seu idx_remove:\n\n');
fprintf('idx_remove = ismember(names, {');
for k = 1:length(estacoes_ruins)
    if k == length(estacoes_ruins)
        fprintf('''%s''', estacoes_ruins{k});
    else
        fprintf('''%s'', ', estacoes_ruins{k});
    end
end
fprintf('});\n');

isnan(matrix_list);
sum(isnan(matrix_list))

return

matrix_list(isnan(matrix_list)) = [];


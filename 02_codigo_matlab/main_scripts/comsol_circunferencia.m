addpath(genpath('C:\Users\DAVID\Desktop\Ordenado\Tesis_Fisica_Modelado\02_codigo_matlab\funciones'));
savepath;
[~, tStart] = iniciarLog();
dir_mph = 'C:\Users\DAVID\Desktop\Ordenado\Tesis_Fisica_Modelado\01_modelos_comsol\archivos_mph'

% ==================== Empieza el código ====================
import com.comsol.model.util.*

name_mph = 'circunferencia.mph'
dir = [dir_mph '\' name_mph]
model = mphopen(dir);

H = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
T = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.85,0.9,0.95,0.96,0.97,0.98,0.991,0.992,0.993,0.994,0.995,0.996,0.997,0.998,0.999,0.9999];

for i = 1:length(H)
    for j =1:length(T)
        model.param.set('H',H(i));
        model.param.set('T',T(j));
        model.study('std1').run;
        %subplot(2,2,i);
        %mphplot(model,'pg1','rangenum',2);
        v(i,j) = mphint2(model, 'u/314', 'surface');
        M(i,j) = H(i) - v(i,j);   
        
    end
end

% ==================== Exportar en CSV ====================
T = [T; M]';
csvwrite(['C:\Users\DAVID\Desktop\Ordenado\Tesis_Fisica_Modelado\02_codigo_matlab\resultados\data_' name_mph '.csv'], T);
% ==================== Para el log ====================
elapsedTime = toc(tStart);
fprintf('Tiempo de ejecución: %.3f segundos\n', elapsedTime);
fprintf('[%s] Fin de simulación\n', datestr(now, 'yyyy-mm-dd_HH-MM-SS'));
diary off;
clear; clc; close all;
addpath(genpath('C:\Users\DAVID\Desktop\Ordenado\Tesis_Fisica_Modelado\02_codigo_matlab\funciones'));
savepath;
[~, tStart] = iniciarLog();
dir_mph = 'C:\Users\DAVID\Desktop\Ordenado\Tesis_Fisica_Modelado\01_modelos_comsol\archivos_mph'

% ==================== Empieza el código ====================
import com.comsol.model.util.*

name = 'triangulo_OK' %%%%%%% CAmbiar el nombre del archivo
dir = [dir_mph '\' name '.mph']
model = mphopen(dir);

H = 0.1:0.1:1.;
Delta_T = 0.01:0.01:0.99;

for i = 1:length(H)
    for j =1:length(Delta_T)
        model.param.set('H',H(i));
        model.param.set('T',Delta_T(j));
        model.study('std1').run;
        v(i,j) = mphint2(model, 'u/(A)', 'surface');
        M(i,j) = H(i) - v(i,j);   
        
    end
end

% ==================== Exportar en CSV ====================
res = [Delta_T; M]';
dlmwrite(['C:\Users\DAVID\Desktop\Ordenado\Tesis_Fisica_Modelado\02_codigo_matlab\resultados\data_' name '.csv'], res, 'delimiter', ',','precision', 20)
%csvwrite(['C:\Users\DAVID\Desktop\Ordenado\Tesis_Fisica_Modelado\02_codigo_matlab\resultados\data_' name_mph '.csv'], res);
% ==================== Para el log ====================
elapsedTime = toc(tStart);
fprintf('Tiempo de ejecución: %.3f segundos\n', elapsedTime);
fprintf('[%s] Fin de simulación\n', datestr(now, 'yyyy-mm-dd_HH-MM-SS'));
diary off;
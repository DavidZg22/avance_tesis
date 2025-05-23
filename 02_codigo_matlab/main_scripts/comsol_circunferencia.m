clear; clc; close all;
addpath(genpath('C:\Users\DAVID\Desktop\Ordenado\Tesis_Fisica_Modelado\02_codigo_matlab\funciones'));
savepath;
[~, tStart] = iniciarLog();
dir_mph = 'C:\Users\DAVID\Desktop\Ordenado\Tesis_Fisica_Modelado\01_modelos_comsol\archivos_mph'

% ==================== Empieza el c�digo ====================
import com.comsol.model.util.*

name_mph = 'circunferencia_V01.mph'
dir = [dir_mph '\' name_mph]
model = mphopen(dir);

H = 0.1:0.1:1.;
T_1 = 0.1:0.1:0.9;
T_2 = 0.91:0.01:0.99;
T_3 = 0.991:0.001:0.999;
T_4 = 0.9991:0.0001:0.9999;
T = [T_1, T_2, T_3, T_4];

for i = 1:length(H)
    for j =1:length(T)
        model.param.set('H',H(i));
        model.param.set('T',T(j));
        model.study('std1').run;
        %subplot(2,2,i);
        %mphplot(model,'pg1','rangenum',2);
        v(i,j) = mphint2(model, 'u/(A-4*pi)', 'surface');
        M(i,j) = H(i) - v(i,j);   
        
    end
end

% ==================== Exportar en CSV ====================
res = [T; M]';
csvwrite(['C:\Users\DAVID\Desktop\Ordenado\Tesis_Fisica_Modelado\02_codigo_matlab\resultados\data_' name_mph '.csv'], res);
% ==================== Para el log ====================
elapsedTime = toc(tStart);
fprintf('Tiempo de ejecuci�n: %.3f segundos\n', elapsedTime);
fprintf('[%s] Fin de simulaci�n\n', datestr(now, 'yyyy-mm-dd_HH-MM-SS'));
diary off;

figure;
hold on;
for i = 1:length(H)
    plot(T,M(i,:),'LineStyle', '--', 'Marker', 'o','DisplayName', sprintf('H = %d', H(i)));
end
xlabel('$$T/T_c$$', 'Interpreter', 'latex');
ylabel('$$-4\pi M$$', 'Interpreter', 'latex');
title(['Magnetizacion Vs T (' name_mph ')']);
legend show;
hold off;
grid on;
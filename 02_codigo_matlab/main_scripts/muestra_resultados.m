dir_resul = 'C:\Users\DAVID\Desktop\Ordenado\Tesis_Fisica_Modelado\02_codigo_matlab\resultados\'
simul = {'circulo_OK', 'cuadrado_OK', 'triangulo_OK'};

x = {H}; %%%% Es lo mismo de H
f_x = {};
area = {};
Delta_S = {};
Delta_T = {};
data = {};

for m =1:length(simul)
    name = simul{m};
    data{m} = dlmread([dir_resul 'data_' name '.csv'], ',');
    
    Delta_T{m}   = data{m}(:,1);         
    f_x{m} = data{m}(:,2:end)';     
   
    for j =1:size(f_x{m},2)
        area{m}(j) = abs(trapz(x{1}, f_x{m}(:,j)));
    end 
    
    for i = 1:98
        Delta_S{m}(i) = abs((1/(Delta_T{1}(2)-Delta_T{1}(1)))*(area{m}(i+1)-area{m}(i)));
    end
end

figure;

for i = 1:length(simul)
    subplot(1, 3, i);  % 1 fila, 3 columnas, subplot i
    plot(Delta_T{i}(1:end-1),Delta_S{i}, 'bo-', 'LineWidth', 1.5);
    title(simul{i}, 'Interpreter', 'none');
    ylim([0,5]);
    xlabel('T');
    ylabel('S');
    grid on;
end

suptitle('S vs T para cada figura');





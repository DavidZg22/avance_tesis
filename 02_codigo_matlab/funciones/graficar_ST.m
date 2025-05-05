function graficar_ST(dir_resul, simul, H)
    x = {H};  % Eje x común para todas las figuras
    f_x = {};
    area = {};
    Delta_S = {};
    Delta_T = {};
    data = {};

    for m = 1:length(simul)
        name = simul{m};
        data{m} = dlmread([dir_resul 'data_' name '.csv'], ',');

        Delta_T{m} = data{m}(:,1);         
        f_x{m} = data{m}(:,2:end)';  % transponer para que columnas sean por T

        for j = 1:size(f_x{m},2)
            area{m}(j) = abs(trapz(x{1}, f_x{m}(:,j)));
        end 

        for i = 1:length(area{m}) - 1
            Delta_S{m}(i) = abs((1 / (Delta_T{m}(2) - Delta_T{m}(1))) * ...
                                (area{m}(i+1) - area{m}(i)));
        end
    end

    figure;
    for i = 1:length(simul)
        subplot(1, 3, i);
        plot(Delta_T{i}(1:end-1), Delta_S{i}, 'bo-', 'LineWidth', 1.5);
        title(simul{i}, 'Interpreter', 'none');
        ylim([0, 5]);
        xlabel('T');
        ylabel('S');
        grid on;
    end

    % Título general compatible con MATLAB 2017
    annotation('textbox', [0 0.95 1 0.05], ...
               'String', 'S vs T para cada figura', ...
               'EdgeColor', 'none', ...
               'HorizontalAlignment', 'center', ...
               'FontSize', 12, 'FontWeight', 'bold');
end
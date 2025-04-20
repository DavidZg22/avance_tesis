% Inicializar log y temporizador
[~, tStart] = iniciarLog();

% === Tu código de simulación ===
a = rand(1,5);
b = a.^2;
pause(2);  % Simula una tarea larga

% Tiempo final y cierre del log
elapsedTime = toc(tStart);
fprintf('?? Tiempo de ejecución: %.3f segundos\n', elapsedTime);
fprintf('? [%s] Fin de simulación\n', datestr(now, 'yyyy-mm-dd_HH-MM-SS'));
diary off;
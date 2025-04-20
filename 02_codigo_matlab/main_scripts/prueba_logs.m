% Inicializar log y temporizador
[~, tStart] = iniciarLog();

% === Tu c�digo de simulaci�n ===
a = rand(1,5);
b = a.^2;
pause(2);  % Simula una tarea larga

% Tiempo final y cierre del log
elapsedTime = toc(tStart);
fprintf('?? Tiempo de ejecuci�n: %.3f segundos\n', elapsedTime);
fprintf('? [%s] Fin de simulaci�n\n', datestr(now, 'yyyy-mm-dd_HH-MM-SS'));
diary off;
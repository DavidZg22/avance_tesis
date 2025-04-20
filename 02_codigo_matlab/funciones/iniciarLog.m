function [diaryFile, tStart] = iniciarLog(logFolder)
% iniciarLog  Inicializa un log automático y devuelve el tiempo de inicio.
%
% USO:
%   [diaryFile, tStart] = iniciarLog()
%   [diaryFile, tStart] = iniciarLog('mi/carpeta')
%
% Salidas:
%   diaryFile: ruta completa del archivo log creado
%   tStart: temporizador tic para medir tiempo de ejecución

    if nargin < 1 || isempty(logFolder)
        logFolder = fullfile('C:\Users\DAVID\Desktop\Ordenado\Tesis_Fisica_Modelado\04_logs\matlab');
    end

    % Obtener nombre del script que llama esta función
    stackInfo = dbstack;
    if numel(stackInfo) < 2
        scriptName = 'scriptInteractivo';
    else
        [~, scriptName] = fileparts(stackInfo(2).file);
    end

    % Crear carpeta si no existe
    if ~exist(logFolder, 'dir')
        mkdir(logFolder);
    end

    % Generar nombre del archivo de log
    timestamp = datestr(now, 'yyyy-mm-dd_HH-MM-SS');
    logFileName = sprintf('log_%s_%s.txt', scriptName, timestamp);
    diaryFile = fullfile(logFolder, logFileName);

    % Iniciar log y temporizador
    diary(diaryFile);
    fprintf('? [%s] Inicio de ejecución: %s\n', timestamp, scriptName);
    tStart = tic;  % iniciar cronómetro
end
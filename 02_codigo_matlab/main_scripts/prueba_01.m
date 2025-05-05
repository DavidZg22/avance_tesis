% clear; clc; close all;
x = H;
y = res(1,2:end);

h = x(2) - x(1);         % paso uniforme

dy = zeros(size(y));    % prealocar

% Diferencia hacia adelante
dy(1) = (y(2) - y(1)) / h;

% Diferencia centrada
for i = 2:length(x)-1
    dy(i) = (y(i+1) - y(i-1)) / (2*h);
end

% Diferencia hacia atrás
dy(end) = (y(end) - y(end-1)) / h;
area_aprox = trapz(x,y);

I = trapz(x,y);
    
disp('   x         y = x^3      dy/dx (num)');
disp([x' y' dy']);
disp(area_aprox)
figure;
plot(x,y,'bo-'); hold on;
plot(x, dy, 'rs--')
hold off;

grid on;
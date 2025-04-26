clear; clc; close all;
s = sqrt(2.);
h = 1.;
M = 60.;

F_1 = cose(s);

for k=0:M
    F_2 = cose(s + h);
    d = F_2 - F_1;
    r = vpa(d)/vpa(h);
    fprintf('k= %d | h = %.8f | F2 = %.8f | F1 = %.8f | d = %.8f | r = %.20f\n',k, h, F_2, F_1, d, r);
    h = h/2;
    K_i(k+1) = k;
    D_i(k+1) = d;
    R_i(k+1) = r;
end

figure
plot(K_i, R_i, 'o');
grid on;

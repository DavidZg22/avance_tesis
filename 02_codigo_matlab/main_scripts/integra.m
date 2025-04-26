x = pi/4;
h = 0.01;

der = 1/h*(cose(x+h) - cose(x));
err = abs(h/2*cose(x));
fprintf('El valor de la derivado para x = %.4f, es %.8f, y el error es %.5f\n', x, der, err);


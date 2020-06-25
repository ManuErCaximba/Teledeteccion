% Ejercicio 4.3
function [J,K] = mifft2(I)
    fft = fft2(I);
    J = mesh(abs(fft));
    K = mesh(unwrap(angle(fft)));
end
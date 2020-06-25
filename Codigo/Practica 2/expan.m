% Ejercicio 2.2
function J = expan(I, m, M)
    J = (I-m)*(254/(M-m))+1;
    imshow(J);
end


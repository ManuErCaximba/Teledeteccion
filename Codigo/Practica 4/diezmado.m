% Ejercicio 4.1
function J = diezmado(I,r)
    salto = single(1/(1-r));
    J = I(1:salto:end, :);
    J = J(:, 1:salto:end);
    imshow(J);
    imwrite(J, '.\resultadoDiezmado.png', 'png');
end
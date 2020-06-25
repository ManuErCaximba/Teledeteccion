%Ejercicio 5.1a
function J = falso(R, G, B)
    J = R;
    J(:,:,2) = G;
    J(:,:,3) = B;
    imshow(J);
    imwrite(J, '.\resultadofiltro.png', 'png');
end


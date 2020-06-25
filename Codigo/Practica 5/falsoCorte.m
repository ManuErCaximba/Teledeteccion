%Ejercicio 5.1b
function J = falsoCorte(R, G, B, p)
    %Funcion corte de la practica 2
    J = corte(R,p);
    J(:,:,2) = corte(G,p);
    J(:,:,3) = corte(B,p);
    imshow(J);
    imwrite(J, '.\resultadofiltro.png', 'png');
end


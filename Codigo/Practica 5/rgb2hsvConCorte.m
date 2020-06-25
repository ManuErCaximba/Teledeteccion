%Ejercicio 5.5
function J = rgb2hsvConCorte(R, G, B, p, SoVoB)
    %SoVoB puede ser 0, 1 o 2; indicando si 0 que el corte se hace en
    %S, 1 que se hace en V y 2 indicando que se hace en ambos
    I = falso(R, G, B);
    J = rgb2hsv(I);
    J = uint8(J.*255);
    %Corte de colas
    if SoVoB == 0
        J(:,:,2) = corte(J(:,:,2),p);
    elseif SoVoB == 1
        J(:,:,3) = corte(J(:,:,3),p);
    elseif SoVoB == 2
        J(:,:,2) = corte(J(:,:,2),p);
        J(:,:,3) = corte(J(:,:,3),p);
    end
    J = double(J)./255;
    J = hsv2rgb(J);
    J = uint8(J.*255);
    imshow(J);
    imwrite(J, '.\resultadoRGB2HSV.png', 'png');
end


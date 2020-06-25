% Ejercicio 5.3
function J = ndvi(R, NIR)
    [m,n] = size(R);
    J = zeros(m,n);
    J = double(J);
    for i = 1:m
       for j = 1:n
           nir = double(NIR(i,j));
           r = double(R(i,j));
           J(i,j) = (nir-r)/(nir+r);
       end
    end
    J = J+1;
    J = 127.5*J;
    J = uint8(J);
    imshow(J);
    imwrite(J, '.\resultadoNDVI.png', 'png');
end


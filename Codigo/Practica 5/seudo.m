% Ejercicio 5.2
function J = seudo(I, p)
    [m,n] = size(I);
    R = zeros(m,n);
    G = zeros(m,n);
    B = zeros(m,n);
    for i = 1:m
       for j = 1:n
          if I(i,j) < p
              B(i,j) = 255;
          else
              R(i,j) = 255;
          end
       end
    end
    J = uint8(R);
    J(:,:,2) = uint8(G);
    J(:,:,3) = uint8(B);
    imshow(J);
    imwrite(J, '.\resultadoSeudo.png', 'png');
end


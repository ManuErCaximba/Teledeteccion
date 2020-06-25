% Ejercicio 5.4
function J = densi(I, p, P)
    [m,n] = size(I);
    r = (P-p);
    % Variar los pesos para cambiar los rangos de color
    p1 = p + (r*0.25);
    p2 = p1 + (r*0.3);
    p3 = p2 + (r*0.15);
    R = zeros(m,n);
    G = zeros(m,n);
    B = zeros(m,n);
    for i = 1:m
       for j = 1:n
          if I(i,j) >= p && I(i,j) < p1
              B(i,j) = 255;
          elseif I(i,j) >= p1 && I(i,j) < p2
              G(i,j) = 255;
          elseif I(i,j) >= p2 && I(i,j) < p3
              R(i,j) = 255;
              G(i,j) = 255;
          elseif I(i,j) >= p3 && I(i,j) <= P
              R(i,j) = 255;
          else
              if I(i,j) ~= 0
                  R(i,j) = 50;
                  G(i,j) = 50;
                  B(i,j) = 50;
              else
                  R(i,j) = 0;
                  G(i,j) = 0;
                  B(i,j) = 0;
              end
          end
       end
    end
    J = uint8(R);
    J(:,:,2) = uint8(G);
    J(:,:,3) = uint8(B);
    imshow(J);
    imwrite(J, '.\resultadoDensi.png', 'png');
end


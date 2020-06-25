%Ejercicio 4.2
function J = amplia(I)
    [m,n] = size(I);
    J = zeros(m*2, n*2);
    %Paso 1
    for i=1:m
        for j=1:n
            t = (i*2)-1;
            s = (j*2)-1;
            J(t,s) = I(i,j);
        end
    end
    %Paso 2
    [t,s] = size(J);
    for i=1:2:t
        for j=2:2:s-1
            rlelem = [J(i,j-1),J(i,j+1)];
            if J(i,j+1)~=0
                J(i,j) = mean(rlelem);
            else
                J(i,j) = J(i,j-1);
            end
        end
    end
    %Paso 3
    for i=2:2:t-1
        for j=1:2:s
            rlelem = [J(i-1,j),J(i+1,j)];
            if J(i+1,j)~=0
                J(i,j) = mean(rlelem);
            else
                J(i,j) = J(i-1,j);
            end
        end
    end
    for i=2:2:t-1
        for j=2:2:s-1
            rlelem = [J(i-1,j),J(i+1,j),J(i,j-1),J(i,j+1)];
            if J(i+1,j)~=0 && J(i,j+1)~=0
                J(i,j) = mean(rlelem);
            elseif J(i+1,j)~=0 && J(i,j+1)==0
                J(i,j) = J(i,j-1);
            elseif J(i+1,j)==0
                J(i,j) = J(i-1,j);
            end
        end
    end
    %Paso 4
    J = uint8(J);
    % Resultado
    imshow(J);
    imwrite(J, '.\resultadoAmplia.png', 'png');
end
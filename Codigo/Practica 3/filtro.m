% Ejercicio 3.1
function J = filtro(I,F)
    J = I;
    [m,n] = size(I);
    J(1,:) = zeros(1,n);
    J(end,:) = zeros(1,n);
    J(:,1) = zeros(m,1);
    J(:,end) = zeros(m,1);
    for i = 2:(m-1)
        for j = 2:(n-1)
            A = int8([
                I(i-1,j-1) I(i-1,j) I(i-1,j+1);
                I(i,j-1) I(i,j) I(i,j+1);
                I(i+1,j-1) I(i+1,j) I(i+1,j+1)
                ]);
            B = A.*F;
            J(i,j) = sum(sum(B));
        end
    end
    imshow(J);
    imwrite(J, '.\resultadoFiltro.png', 'png');
end


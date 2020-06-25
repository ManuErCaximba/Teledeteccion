% Ejercicio 3.3
function J = filtroN(I,F)
    J = I;
    [m,n] = size(I);
    J(1,:) = zeros(1,n);
    J(end,:) = zeros(1,n);
    J(:,1) = zeros(m,1);
    J(:,end) = zeros(m,1);
    N = (1/sum(sum(F)))*double(F);
    for i = 2:(m-1)
        for j = 2:(n-1)
            A = double([
                I(i-1,j-1) I(i-1,j) I(i-1,j+1);
                I(i,j-1) I(i,j) I(i,j+1);
                I(i+1,j-1) I(i+1,j) I(i+1,j+1)
                ]);
            B = A.*N;
            J(i,j) = sum(sum(B));
        end
    end
    imshow(J);
    imwrite(J, '.\resultadoFiltroN.png', 'png');
end


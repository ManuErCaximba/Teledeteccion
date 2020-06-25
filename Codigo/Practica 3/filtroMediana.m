% Ejercicio 3.4
function J = filtroMediana(I)
    J = I;
    F = [1,1,1;1,1,1;1,1,1];
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
            %{
                Hacemos media de los pixeles de A y vemos la diferencia
                con el pixel actual, si hay una diferencia de 40, se hace
                la mediana
            %}
            mn = mean(mean(A));
            mn = double(I(i,j)) - double(mn);
            if  mn >= 40 || mn <= -40
                B = A.*N;
                J(i,j) = sum(sum(B));
            end
        end
    end
    imshow(J);
    imwrite(J, '.\resultadoFiltroMediana.png', 'png');
end


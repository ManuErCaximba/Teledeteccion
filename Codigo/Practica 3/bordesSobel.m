% Ejercicio 3.5
function J = bordesSobel(I)
    J = I;
    [m,n] = size(I);
    J(1,:) = zeros(1,n);
    J(end,:) = zeros(1,n);
    J(:,1) = zeros(m,1);
    J(:,end) = zeros(m,1);
    for i = 2:(m-1)
        for j = 2:(n-1)
            A = single([
                I(i-1,j-1) I(i-1,j) I(i-1,j+1);
                I(i,j-1) I(i,j) I(i,j+1);
                I(i+1,j-1) I(i+1,j) I(i+1,j+1)
                ]);
            % Funciones sacadas de Wikipedia
            X = single([-1 0 1; -2 0 2; -1 0 1]);
            Y = single([-1 -2 -1; 0 0 0; 1 2 1]);
            Gx = X.*A;
            Gy = Y.*A;
            sumGx = sum(sum(Gx));
            sumGy = sum(sum(Gy));
            Gxy = sumGx^2 + sumGy^2;
            G = sqrt(Gxy);
            J(i,j) = sum(sum(G));
        end
    end
    imshow(J);
    imwrite(J, '.\resultadoBordesSobel.png', 'png');
end


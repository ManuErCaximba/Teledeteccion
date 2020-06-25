% Ejercicio 2.4
function J = ecual(I)
    hist = histo(I);
    h = hist.Values;
    hac = zeros(1,254);
    P = sum(h);
    fe = 255/P;
    acum = 0;
    for i = 1:254
        inc = h(i);
        acum = acum + inc;
        hac(i) = acum;
    end
    J = I;
    [m,n] = size(J);
    for row = 1:m
        for col = 1:n
            i = I(row,col);
            if i ~= 0
                J(row,col) = hac(i)*fe;
            end
        end
    end
    imshow(J);
    imwrite(J, '.\resultadoEcual.png', 'png');
end


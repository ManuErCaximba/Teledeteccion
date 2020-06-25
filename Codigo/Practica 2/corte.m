% Ejercicio 2.3
function J = corte(I, p)
    h = histo(I);
    values = h.Values;
    nPixels = sum(values);
    percent = nPixels*(p/100);
    m = 0;
    M = 0;
    for i = 1:length(values)
        if values(i) > percent
            m = i - 1;
            break
        end
    end
    for i = length(values):-1:1
        if values(i) > percent
            M = i + 1;
            break
        end
    end
    J = expan(I, m, M);
    imshow(J);
    imwrite(J, '.\resultadoCorte.png', 'png');
end


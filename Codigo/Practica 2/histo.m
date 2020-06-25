% Ejercicio 2.1
function h = histo(I)
    edges = linspace(1, 255, 255);
    h = histogram(I, 'BinEdges',edges);
end


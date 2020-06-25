function K = isodata(I, C)
    [m,n,b] = size(I);
    J = zeros(m,n);
    v = zeros(C,b);
    
    % Establecer C centroides
    for i = 1:C
        cond = 0;
        while cond == 0
            m1 = round(rand*m);
            n1 = round(rand*n);
            v1 = double(I(m1,n1,1:b));
            if prod(v1) > 0
               cond = 1;
               v(i,1:b) = v1;
            end
        end
    end
    
    %Bucle principal
    %bool = 1;          Descomentar para while
    for iter = 1:10
    %{
        Se ha decidido dejar el bucle for con iteracciones fijas porque
        con un while, aunque el resultado es mas exacto, el rendimiento
        empeora considerablemente. Considero que con 10 iteracciones se
        consiguen buenos resultados sin repercutir mucho el rendimiento.
        Aun asi se dejara el codigo con el while
    %}
    %while bool == 1    Descomentar para while
        
        %bool = 0;      Descomentar para while
        
        %Realizar asignacion
        
        for i = 1:m
            for j = 1:n
                nd = double(I(i,j,1:b));
                nd = permute(nd, [3 2 1]);
                nd = nd';
                if prod(nd) > 0
                    d = 9999999;
                    for k = 1:C
                        d1 = norm(nd - v(k,1:b));
                        if d1 < d
                            d = d1;
                            %{
                            
                            Descomentar para while
                            
                            preK = J(i,j);
                            if preK~=k
                                bool = 1;
                            end
                            %}
                            J(i,j) = k;
                        end
                    end
                end
            end
        end

        %Recalcular centroides
        t = m*n;
        s = b*C;
        z = zeros(t,s);
        cont = zeros(1,C);
        for i = 1:m
            for j = 1:n
                nd = double(I(i,j,1:b));
                nd = permute(nd, [3 2 1]);
                nd = nd';
                if prod(nd) > 0
                    for k = 1:C
                        if J(i,j) == k
                            a = cont(1,k);
                            aa = b*k;
                            z(a+1, (aa-(b-1)):aa) = nd;
                            cont(1,k) = cont(1,k) + 1;
                        end
                    end
                end
            end
        end

        for k = 1:C
            a = cont(1,k);
            aa = b*k;
            mn = z(1:a,(aa-(b-1)):aa);
            v(k,1:b) = mean(mn);
        end
        
        
        
        
    end
    
    %Colores
    col = zeros(6,3);
    col(1,1:3) = [255 0 0];
    col(2,1:3) = [0 0 255];
    col(3,1:3) = [0 255 0];
    col(4,1:3) = [255 255 0];
    col(5,1:3) = [0 255 255];
    col(6,1:3) = [255 0 255];
    if C > 6
        for i = 7:C
            col(i,1:3) = [rand*255 rand*255 rand*255];
        end
    end
        
    K = zeros(m,n,3);
        
    for i = 1:m
        for j = 1:n
            for k = 1:C
                if J(i,j) == k
                    c = col(k,1:3);
                    c = permute(c, [1 3 2]);
                    K(i,j,1:3) = c;
                end
            end
        end
    end
    K = uint8(K);
    imshow(K);
end


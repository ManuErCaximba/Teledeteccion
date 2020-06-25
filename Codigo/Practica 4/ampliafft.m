% Ejercicio 4.4
function J = ampliafft(I,r)
    [m,n] = size(I);
    t = m * r;
    s = n * r;
    FFTI = fft2(I);
    FFTJ = zeros(t,s);
    FFTJ(1:(m/2), 1:(n/2)) = FFTI(1:(m/2), 1:(n/2));
    %Copiar el resto de cuadrantes
    FFTJ((t-(m/2)):end, 1:(n/2)) = FFTI((m/2):end, 1:(n/2));
    FFTJ((t-(m/2)):end, (s-(n/2)):end) = FFTI((m/2):end, (n/2):end);
    FFTJ((1:(m/2)), (s-(n/2)):end) = FFTI(1:(m/2), (n/2):end); 
    %Volver al dominio del espacio (ifft2) obteniendo im2 amplificada
    J = real(ifft2(FFTJ)*(r^2));
    %Castear a uint8
    J = uint8(J);
    imshow(J);
    imwrite(J, '.\resultadoAmpliaFFT.png', 'png');
end


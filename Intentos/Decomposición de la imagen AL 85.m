%% PASO 1: Decomposición de la imagen porque son muchos colores:

ZR = imagen_bocachica2(:,:,1);
ZG = imagen_bocachica2(:,:,2);
ZB = imagen_bocachica2(:,:,3);

% Los EigenValues están limitados por el numero de filas.
[UR,SR,VR]=svd(ZR); 
[UG,SG,VG]=svd(ZG); 
[UB,SB,VB]=svd(ZB); 

% Se modifica el codigo inicial sabiendo que se aprovecharán todas las
% filas siempre y cuando se determine una cifra M que eventualmente
% representará el porcentaje de elementos de la matriz original que serán
% correspondidos. Como la matriz no es cuadrada el máximo es 515.
%%  PASO 2: Vectores de Valores Propios y Cantidades Totales
Suma_total2R = sum(sum(SR));
Suma_total2G = sum(sum(SG));
Suma_total2B = sum(sum(SB));

% La posicion será el final de el vector incial menos el indice
% correspondiente al elemento. Osea que si el elemento es el primero, su
% posicion será end-1, end-2 al segundo elemento etc.
VER_RED = reshape(SR,1,size(SR,1)*size(SR,2)) ;
VER_RED = unique(VER_RED); 
VER_RED2 = VER_RED;
for i = 1:length(VER_RED2)
    VER_RED(i) = VER_RED2(end+1-i);   
end
VER_RED = VER_RED(1:end-1);

% VERDE
VER_GREEN = reshape(SG,1,size(SG,1)*size(SG,2)) ;
VER_GREEN = unique(VER_GREEN); 
VER_GREEN2 = VER_GREEN;
for i = 1:length(VER_GREEN2)
    VER_GREEN(i) = VER_GREEN2(end+1-i);   
end
VER_GREEN = VER_GREEN(1:end-1);

% AZUL
VER_BLUE = reshape(SB,1,size(SB,1)*size(SB,2)) ;
VER_BLUE = unique(VER_BLUE); 
VER_BLUE2 = VER_BLUE;
for i = 1:length(VER_BLUE2)
    VER_BLUE(i) = VER_BLUE2(end+1-i);   
end
VER_BLUE = VER_BLUE(1:end-1);
%%   PASO 3:Calculo Para Porcentajes
% Porcentaje de 25%
P1 = 25/100; 
for i = 1:length(VER_RED)
    if sum(VER_RED(1:i)) <= round(P1*Suma_total2R) & sum(VER_RED(1:i+1)) > round((P1)*Suma_total2R) 
         j = i;
    else 
        i = i+1;
    end
end
M1R= j  ;clearvars i j;

for i = 1:length(VER_GREEN)
    if sum(VER_GREEN(1:i)) <= round(P1*Suma_total2G) & sum(VER_GREEN(1:i+1)) > round((P1)*Suma_total2G) 
         j = i;
    else 
        i = i+1;
    end
end
M1G = j;clearvars i j;

for i = 1:length(VER_BLUE)
    if sum(VER_BLUE(1:i)) <= round(P1*Suma_total2B) & sum(VER_BLUE(1:i+1)) > round((P1)*Suma_total2B) 
         j = i;
    else 
        i = i+1;
    end
end
M1B = j;clearvars i j;
% Porcentaje 65%
P2 = 65/100;
for i = 1:length(VER_RED)
    if sum(VER_RED(1:i)) <= round(P2*Suma_total2R) & sum(VER_RED(1:i+1)) > round((P2)*Suma_total2R) 
         j = i;
    else 
        i = i+1;
    end
end
M2R = j;clearvars i j;

for i = 1:length(VER_GREEN)
    if sum(VER_GREEN(1:i)) <= round(P2*Suma_total2G) & sum(VER_GREEN(1:i+1)) > round((P2)*Suma_total2G) 
         j = i;
    else 
        i = i+1;
    end
end
M2G = j;clearvars i j;

for i = 1:length(VER_BLUE)
    if sum(VER_BLUE(1:i)) <= round(P2*Suma_total2B) & sum(VER_BLUE(1:i+1)) > round((P2)*Suma_total2B) 
         j = i;
    else 
        i = i+1;
    end
end
M2B = j;clearvars i j;
% Porcentaje 85%
P3 = 85/100;
for i = 1:length(VER_RED)
    if sum(VER_RED(1:i)) <= round(P3*Suma_total2R) & sum(VER_RED(1:i+1)) > round((P3)*Suma_total2R) 
         j = i;
    else 
        i = i+1;
    end
end
M3R = j ;clearvars i j;

for i = 1:length(VER_GREEN)
    if sum(VER_GREEN(1:i)) <= round(P3*Suma_total2G) & sum(VER_GREEN(1:i+1)) > round((P3)*Suma_total2G) 
         j = i;
    else 
        i = i+1;
    end
end
M3G = j;clearvars i j;

for i = 1:length(VER_BLUE)
    if sum(VER_BLUE(1:i)) <= round(P3*Suma_total2B) & sum(VER_BLUE(1:i+1)) > round((P3)*Suma_total2B) 
         j = i;
    else 
        i = i+1;
    end
end
M3B = j;clearvars i j;
%%     PASO 4: Elegir los Single Values que acumulen el 65% de la Suma Total
UhR=UR(:,[1:M2R]);
ShR=SR(1:M2R,1:M2R);
VhR=VR(:,[1:M2R]); 
 
UhG=UG(:,[1:M2G]);
ShG=SG(1:M2G,1:M2G);
VhG=VG(:,[1:M2G]);
 
UhB=UG(:,[1:M2B]);
ShB=SG(1:M2B,1:M2B);
VhB=VG(:,[1:M2B]); 

CR=UhR*ShR*VhR';
CG=UhG*ShG*VhG';
CB=UhB*ShB*VhB';
Crgb2 = cat(3,CR,CG,CB);
figure('Name','Aquellos que acumulan el 65% de la Suma Total')
imshow(uint8(Crgb2))
title('Aquellos que acumulan el 65% de la Suma Total')
clearvars Crgb;

%% Imagen comprimida en un 35% 
Crgb2;









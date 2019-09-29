%% PASO 0 : Se importa la imagen
figure('Name','Imagen Original de Boca Chica')
imagen_bocachica = imread('boca_chica.jpg');
imshow(imagen_bocachica)
title('Imagen Original de Boca Chica')


imagen_bocachica2 = double(imagen_bocachica);
clearvars imagen_bocachica4 imagen_bocachicaB imagen_bocachicaG imagen_bocachicaR
LAT = size(imagen_bocachica,1)
LONG = size(imagen_bocachica,2)
HOR = size(imagen_bocachica,1)*size(imagen_bocachica,2)
imagen_bocachica3 = reshape(imagen_bocachica2 ,HOR,3);
%% PASO 1: Decomposici�n de la imagen

ZR = imagen_bocachica2(:,:,1);
ZG = imagen_bocachica2(:,:,2);
ZB = imagen_bocachica2(:,:,3);

% Los EigenValues est�n limitados por el numero de filas.
[UR,SR,VR]=svd(ZR); 
[UG,SG,VG]=svd(ZG); 
[UB,SB,VB]=svd(ZB); 

% Se modifica el codigo inicial sabiendo que se aprovechar�n todas las
% filas siempre y cuando se determine una cifra M que eventualmente
% representar� el porcentaje de elementos de la matriz original que ser�n
% correspondidos. Como la matriz no es cuadrada el m�ximo es 515.
%%  PASO 2: Vectores de Valores Propios y Cantidades Totales
Suma_total2R = sum(sum(SR));
Suma_total2G = sum(sum(SG));
Suma_total2B = sum(sum(SB));

% La posicion ser� el final de el vector incial menos el indice
% correspondiente al elemento. Osea que si el elemento es el primero, su
% posicion ser� end-1, end-2 al segundo elemento etc.
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
%%   PASO 3: Calculo Para Porcentajes
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
%%    PASO 4: Elegir los Single Values que acumulen el 65% de la Suma Total
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

figure('Name','Imagen Comprimida que acumula el 65% de la informaci�n Original')
imshow(uint8(Crgb2))
title('Imagen Comprimida en un 35%')
clearvars Crgb;
%%     PASO 5: Imagen comprimida en un 35% 
Crgb2;
Crgb3 = Crgb2;
find(Crgb2 < 0) = 0;
find(Crgb2 > 255) = 255;
% Primera Capa de Color
% R es la capa roja de la imagen
imagen_bocachicaR = round(reshape(Crgb3(:,:,1) ,HOR,1)) ;
% G y B corresponden a verde y azul respectivamente
imagen_bocachicaG = round(reshape(Crgb3(:,:,2) ,HOR,1)) ;
imagen_bocachicaB = round(reshape(Crgb3(:,:,3) ,HOR,1)) ;
%% *************************************************************************************************************************************
%% BLOQUE DE CUANTIZACION
%% INICALIZACION DE TABLA
%% TODOS LOS 8 BITS tipo 3
 Todos_los_8bits_tipo3 = ([[0;0;0;0;0;0;0;0],[...
0;0;0;0;0;0;0;1],[...
0;0;0;0;0;0;1;0],[...
0;0;0;0;0;0;1;1],[...
0;0;0;0;0;1;0;0],[...
0;0;0;0;0;1;0;1],[...
0;0;0;0;0;1;1;0],[...
0;0;0;0;0;1;1;1],[...
0;0;0;0;1;0;0;0],[...
0;0;0;0;1;0;0;1],[...
0;0;0;0;1;0;1;0],[...
0;0;0;0;1;0;1;1],[...
0;0;0;0;1;1;0;0],[...
0;0;0;0;1;1;0;1],[...
0;0;0;0;1;1;1;0],[...
0;0;0;0;1;1;1;1],[...
0;0;0;1;0;0;0;0],[...
0;0;0;1;0;0;0;1],[...
0;0;0;1;0;0;1;0],[...
0;0;0;1;0;0;1;1],[...
0;0;0;1;0;1;0;0],[...
0;0;0;1;0;1;0;1],[...
0;0;0;1;0;1;1;0],[...
0;0;0;1;0;1;1;1],[...
0;0;0;1;1;0;0;0],[...
0;0;0;1;1;0;0;1],[...
0;0;0;1;1;0;1;0],[...
0;0;0;1;1;0;1;1],[...
0;0;0;1;1;1;0;0],[...
0;0;0;1;1;1;0;1],[...
0;0;0;1;1;1;1;0],[...
0;0;0;1;1;1;1;1],[...
0;0;1;0;0;0;0;0],[...
0;0;1;0;0;0;0;1],[...
0;0;1;0;0;0;1;0],[...
0;0;1;0;0;0;1;1],[...
0;0;1;0;0;1;0;0],[...
0;0;1;0;0;1;0;1],[...
0;0;1;0;0;1;1;0],[...
0;0;1;0;0;1;1;1],[...
0;0;1;0;1;0;0;0],[...
0;0;1;0;1;0;0;1],[...
0;0;1;0;1;0;1;0],[...
0;0;1;0;1;0;1;1],[...
0;0;1;0;1;1;0;0],[...
0;0;1;0;1;1;0;1],[...
0;0;1;0;1;1;1;0],[...
0;0;1;0;1;1;1;1],[...
0;0;1;1;0;0;0;0],[...
0;0;1;1;0;0;0;1],[...
0;0;1;1;0;0;1;0],[...
0;0;1;1;0;0;1;1],[...
0;0;1;1;0;1;0;0],[...
0;0;1;1;0;1;0;1],[...
0;0;1;1;0;1;1;0],[...
0;0;1;1;0;1;1;1],[...
0;0;1;1;1;0;0;0],[...
0;0;1;1;1;0;0;1],[...
0;0;1;1;1;0;1;0],[...
0;0;1;1;1;0;1;1],[...
0;0;1;1;1;1;0;0],[...
0;0;1;1;1;1;0;1],[...
0;0;1;1;1;1;1;0],[...
0;0;1;1;1;1;1;1],[...
0;1;0;0;0;0;0;0],[...
0;1;0;0;0;0;0;1],[...
0;1;0;0;0;0;1;0],[...
0;1;0;0;0;0;1;1],[...
0;1;0;0;0;1;0;0],[...
0;1;0;0;0;1;0;1],[...
0;1;0;0;0;1;1;0],[...
0;1;0;0;0;1;1;1],[...
0;1;0;0;1;0;0;0],[...
0;1;0;0;1;0;0;1],[...
0;1;0;0;1;0;1;0],[...
0;1;0;0;1;0;1;1],[...
0;1;0;0;1;1;0;0],[...
0;1;0;0;1;1;0;1],[...
0;1;0;0;1;1;1;0],[...
0;1;0;0;1;1;1;1],[...
0;1;0;1;0;0;0;0],[...
0;1;0;1;0;0;0;1],[...
0;1;0;1;0;0;1;0],[...
0;1;0;1;0;0;1;1],[...
0;1;0;1;0;1;0;0],[...
0;1;0;1;0;1;0;1],[...
0;1;0;1;0;1;1;0],[...
0;1;0;1;0;1;1;1],[...
0;1;0;1;1;0;0;0],[...
0;1;0;1;1;0;0;1],[...
0;1;0;1;1;0;1;0],[...
0;1;0;1;1;0;1;1],[...
0;1;0;1;1;1;0;0],[...
0;1;0;1;1;1;0;1],[...
0;1;0;1;1;1;1;0],[...
0;1;0;1;1;1;1;1],[...
0;1;1;0;0;0;0;0],[...
0;1;1;0;0;0;0;1],[...
0;1;1;0;0;0;1;0],[...
0;1;1;0;0;0;1;1],[...
0;1;1;0;0;1;0;0],[...
0;1;1;0;0;1;0;1],[...
0;1;1;0;0;1;1;0],[...
0;1;1;0;0;1;1;1],[...
0;1;1;0;1;0;0;0],[...
0;1;1;0;1;0;0;1],[...
0;1;1;0;1;0;1;0],[...
0;1;1;0;1;0;1;1],[...
0;1;1;0;1;1;0;0],[...
0;1;1;0;1;1;0;1],[...
0;1;1;0;1;1;1;0],[...
0;1;1;0;1;1;1;1],[...
0;1;1;1;0;0;0;0],[...
0;1;1;1;0;0;0;1],[...
0;1;1;1;0;0;1;0],[...
0;1;1;1;0;0;1;1],[...
0;1;1;1;0;1;0;0],[...
0;1;1;1;0;1;0;1],[...
0;1;1;1;0;1;1;0],[...
0;1;1;1;0;1;1;1],[...
0;1;1;1;1;0;0;0],[...
0;1;1;1;1;0;0;1],[...
0;1;1;1;1;0;1;0],[...
0;1;1;1;1;0;1;1],[...
0;1;1;1;1;1;0;0],[...
0;1;1;1;1;1;0;1],[...
0;1;1;1;1;1;1;0],[...
0;1;1;1;1;1;1;1],[...
1;0;0;0;0;0;0;0],[...
1;0;0;0;0;0;0;1],[...
1;0;0;0;0;0;1;0],[...
1;0;0;0;0;0;1;1],[...
1;0;0;0;0;1;0;0],[...
1;0;0;0;0;1;0;1],[...
1;0;0;0;0;1;1;0],[...
1;0;0;0;0;1;1;1],[...
1;0;0;0;1;0;0;0],[...
1;0;0;0;1;0;0;1],[...
1;0;0;0;1;0;1;0],[...
1;0;0;0;1;0;1;1],[...
1;0;0;0;1;1;0;0],[...
1;0;0;0;1;1;0;1],[...
1;0;0;0;1;1;1;0],[...
1;0;0;0;1;1;1;1],[...
1;0;0;1;0;0;0;0],[...
1;0;0;1;0;0;0;1],[...
1;0;0;1;0;0;1;0],[...
1;0;0;1;0;0;1;1],[...
1;0;0;1;0;1;0;0],[...
1;0;0;1;0;1;0;1],[...
1;0;0;1;0;1;1;0],[...
1;0;0;1;0;1;1;1],[...
1;0;0;1;1;0;0;0],[...
1;0;0;1;1;0;0;1],[...
1;0;0;1;1;0;1;0],[...
1;0;0;1;1;0;1;1],[...
1;0;0;1;1;1;0;0],[...
1;0;0;1;1;1;0;1],[...
1;0;0;1;1;1;1;0],[...
1;0;0;1;1;1;1;1],[...
1;0;1;0;0;0;0;0],[...
1;0;1;0;0;0;0;1],[...
1;0;1;0;0;0;1;0],[...
1;0;1;0;0;0;1;1],[...
1;0;1;0;0;1;0;0],[...
1;0;1;0;0;1;0;1],[...
1;0;1;0;0;1;1;0],[...
1;0;1;0;0;1;1;1],[...
1;0;1;0;1;0;0;0],[...
1;0;1;0;1;0;0;1],[...
1;0;1;0;1;0;1;0],[...
1;0;1;0;1;0;1;1],[...
1;0;1;0;1;1;0;0],[...
1;0;1;0;1;1;0;1],[...
1;0;1;0;1;1;1;0],[...
1;0;1;0;1;1;1;1],[...
1;0;1;1;0;0;0;0],[...
1;0;1;1;0;0;0;1],[...
1;0;1;1;0;0;1;0],[...
1;0;1;1;0;0;1;1],[...
1;0;1;1;0;1;0;0],[...
1;0;1;1;0;1;0;1],[...
1;0;1;1;0;1;1;0],[...
1;0;1;1;0;1;1;1],[...
1;0;1;1;1;0;0;0],[...
1;0;1;1;1;0;0;1],[...
1;0;1;1;1;0;1;0],[...
1;0;1;1;1;0;1;1],[...
1;0;1;1;1;1;0;0],[...
1;0;1;1;1;1;0;1],[...
1;0;1;1;1;1;1;0],[...
1;0;1;1;1;1;1;1],[...
1;1;0;0;0;0;0;0],[...
1;1;0;0;0;0;0;1],[...
1;1;0;0;0;0;1;0],[...
1;1;0;0;0;0;1;1],[...
1;1;0;0;0;1;0;0],[...
1;1;0;0;0;1;0;1],[...
1;1;0;0;0;1;1;0],[...
1;1;0;0;0;1;1;1],[...
1;1;0;0;1;0;0;0],[...
1;1;0;0;1;0;0;1],[...
1;1;0;0;1;0;1;0],[...
1;1;0;0;1;0;1;1],[...
1;1;0;0;1;1;0;0],[...
1;1;0;0;1;1;0;1],[...
1;1;0;0;1;1;1;0],[...
1;1;0;0;1;1;1;1],[...
1;1;0;1;0;0;0;0],[...
1;1;0;1;0;0;0;1],[...
1;1;0;1;0;0;1;0],[...
1;1;0;1;0;0;1;1],[...
1;1;0;1;0;1;0;0],[...
1;1;0;1;0;1;0;1],[...
1;1;0;1;0;1;1;0],[...
1;1;0;1;0;1;1;1],[...
1;1;0;1;1;0;0;0],[...
1;1;0;1;1;0;0;1],[...
1;1;0;1;1;0;1;0],[...
1;1;0;1;1;0;1;1],[...
1;1;0;1;1;1;0;0],[...
1;1;0;1;1;1;0;1],[...
1;1;0;1;1;1;1;0],[...
1;1;0;1;1;1;1;1],[...
1;1;1;0;0;0;0;0],[...
1;1;1;0;0;0;0;1],[...
1;1;1;0;0;0;1;0],[...
1;1;1;0;0;0;1;1],[...
1;1;1;0;0;1;0;0],[...
1;1;1;0;0;1;0;1],[...
1;1;1;0;0;1;1;0],[...
1;1;1;0;0;1;1;1],[...
1;1;1;0;1;0;0;0],[...
1;1;1;0;1;0;0;1],[...
1;1;1;0;1;0;1;0],[...
1;1;1;0;1;0;1;1],[...
1;1;1;0;1;1;0;0],[...
1;1;1;0;1;1;0;1],[...
1;1;1;0;1;1;1;0],[...
1;1;1;0;1;1;1;1],[...
1;1;1;1;0;0;0;0],[...
1;1;1;1;0;0;0;1],[...
1;1;1;1;0;0;1;0],[...
1;1;1;1;0;0;1;1],[...
1;1;1;1;0;1;0;0],[...
1;1;1;1;0;1;0;1],[...
1;1;1;1;0;1;1;0],[...
1;1;1;1;0;1;1;1],[...
1;1;1;1;1;0;0;0],[...
1;1;1;1;1;0;0;1],[...
1;1;1;1;1;0;1;0],[...
1;1;1;1;1;0;1;1],[...
1;1;1;1;1;1;0;0],[...
1;1;1;1;1;1;0;1],[...
1;1;1;1;1;1;1;0],[...
1;1;1;1;1;1;1;1]])'; 
%% *************************************************************************************************************************************

%% Cuantizacion de Capa Roja
clearvars AmpMaxR AmpMinR vectorwowR vectorR  coslsR roswR
AmpMaxR = max(max(imagen_bocachicaR ));
AmpMinR = min(min(imagen_bocachicaR ));
vectorwowR = AmpMinR:(abs(AmpMinR)+abs(AmpMaxR))/255:AmpMaxR;
vectorR = sort(vectorwowR);
[roswR,coslsR] = sort(vectorR);

clear   j bin  imagen_bocachicaR2 i
binR = 1:length(imagen_bocachicaR);
for j = 1:length(imagen_bocachicaR);
    for i = 1:256-1; % Cantidad de niveles de cuantizacion hasta el ultimo
        if vectorR(i) < imagen_bocachicaR(j) & vectorR(i+1) > imagen_bocachicaR(j)
            % Caso superior al minimo
            imagen_bocachicaR2(j) = vectorR(i+1); % Se cuantiza hacia arriba
        elseif vectorR(i+1) == imagen_bocachicaR(j)
            imagen_bocachicaR2(j) = vectorR(i+1);
         end
    end
end

% Transformacion de la imagen en bits

for i = 1:length(imagen_bocachicaR2);
    for j = 1:length(vectorR);
        if imagen_bocachicaR2(i) == vectorR(j);
            ordenR(i) = coslsR(j); 
        end
    end
end
ordenR(ordenR == 0) = 1;
ordenR(ordenR == 256) = 255;
%% Cuantizacion de Capa Azul : 
AmpMaxB = max(max(imagen_bocachicaB ));
AmpMinB = min(min(imagen_bocachicaB ));
vectorwowB = AmpMinB:(abs(AmpMinB)+abs(AmpMaxB))/255:AmpMaxB;
vectorB = sort(vectorwowB);
[roswB,coslsB] = sort(vectorB);

clear   j bin  imagen_bocachicaB2 i
binB = 1:length(imagen_bocachicaB);
for j = 1:length(imagen_bocachicaB);
    for i = 1:256-1; % Cantidad de niveles de cuantizacion hasta el ultimo
        if vectorB(i) < imagen_bocachicaB(j) & vectorB(i+1) > imagen_bocachicaB(j)
            % Caso superior al minimo
            imagen_bocachicaB2(j) = vectorB(i+1); % Se cuantiza hacia arriba
        elseif vectorB(i+1) == imagen_bocachicaB(j)
            imagen_bocachicaB2(j) = vectorB(i+1);
            
        end
    end
end
% Transformacion de la imagen en bits

for i = 1:length(imagen_bocachicaB2);
    for j = 1:length(vectorB);
        if imagen_bocachicaB2(i) == vectorB(j);
            ordenB(i) = coslsB(j); 
        end
    end
end
ordenB(ordenB == 0) = 1;
ordenB(ordenB == 256) = 255;
%% Cuantizacion de Capa Verde

AmpMaxG = max(max(imagen_bocachicaG ));
AmpMinG = min(min(imagen_bocachicaG ));
vectorwowG = AmpMinG:(abs(AmpMinG)+abs(AmpMaxG))/255:AmpMaxG;
vectorG = sort(vectorwowG);
[roswG,coslsG] = sort(vectorG);

clear   j bin  imagen_bocachicaG2 i
binG = 1:length(imagen_bocachicaG);
for j = 1:length(imagen_bocachicaG);
    for i = 1:256-1; % Cantidad de niveles de cuantizacion hasta el ultimo
        if vectorG(i) < imagen_bocachicaG(j) & vectorG(i+1) > imagen_bocachicaG(j)
            % Caso superior al minimo
            imagen_bocachicaG2(j) = vectorG(i+1); % Se cuantiza hacia arriba
        elseif vectorG(i+1) == imagen_bocachicaG(j)
            imagen_bocachicaG2(j) = vectorG(i+1);
            
        end
    end
end

% Transformacion de la imagen en bits

for i = 1:length(imagen_bocachicaG2);
    for j = 1:length(vectorG);
        if imagen_bocachicaG2(i) == vectorG(j);
            ordenG(i) = coslsG(j); 
        end
    end
end
ordenG(ordenG == 0) = 1;
ordenG(ordenG == 256) = 255;
%% Salidas de Cuantizadores :
% Importando la imagen al modelo
% Se opera el sampling time 
clearvars ts i ts2
% Se tienen 420800 muestras... se busca enviar todas en 1 segundo
% 1/420800

contador = (1:420800)';

% Cuantizador Rojo :
ordenR ;
% Cuantizador Verde :
ordenG ;
% Cuantizador Azul :
ordenB ;
Imagen_REntrada = [contador ordenR'];
Imagen_GEntrada = [contador ordenG'];
Imagen_BEntrada = [contador ordenB'];


%% *************************************************************************************************************************************
%% LA IMAGEN ENTRA AL BLOQUE DE SIMULINK
%% *ANOTACIONES  *****************************************************************************************************************
% De aqu� en adelante se ejecutan las simulaciones 
% La primera simulacion es correspondiente a los 100db
% Segunda Simulacion 60 dB
% Tercera Simulacion 65 dB
% Cuarta Simulacion 85 dB
% 
% Al realizar multiplexaci�n se ha realizado el cambio de tener una sola
% salida conjunta para las tres se�ales, luego unir las capas separadas en
% Matlab. Operando la se�al recibida como una sola imagen directamente
% luego de realizar reshape.
% 
% LIMITACIONES DEL CODIGO:
% Al realizar el proyecto se hallaron las siguientes limitaciones:
% 
% 1. Modificar valores de EbN0 por debajo de 50 dB causa un error en el bloque
% bit to integer luego de salir del demodulador PSK. La causa de este error
% es desconocida, pero se presume est� relacionada con el ruido AWGN
% integrado para la semilla de aleatoriedad espec�fica.
% 
% 2. Debido a la gran cantidad de datos redundantes en la imagen y la
% ausencia de bloques de compresi�n de imagen explicables dentro del material de la
% asignatura, la viabilidad de realizar una compresi�n visual fue
% descartada, y fue necesario realizar una compresi�n en informaci�n.
% 
% 3.  El uso del bloque de demultiplexaci�n para energ�as de bit distintas
% a los 100dB presentados causaba un aumento en la cantidad de se�ales a
% procesar, creando 3 se�ales totalmente distintas por cada capa,
% consecuentemente causando un error de dimensionamiento al ejecutar el
% dise�o de bloques. 

%% * fin de anotaciones  ************************************************************************************************************************************



%% Bloque con exceso de ruido 100dB EBn0
%% Salida del Bloques 8PSK sin Codificacion de Fuente
IR8PSKR = uint8(reshape(IR_PAM_PSKR(1:end-1),LAT,LONG) );
IR8PSKG =uint8(reshape(IR_PAM_PSKG(1:end-1),LAT,LONG)) ;
IR8PSKB = uint8(reshape(IR_PAM_PSKB(1:end-1),LAT,LONG)) ;
%% Visualizacion de la imagen final  sin Codificacion de Fuente
figure('Name','Visualizaci�n Imagen Transmitida sin Codificacion de Fuente ')
Imagen_8PSK_Transmitida100SNR = cat(3,IR8PSKR, IR8PSKG, IR8PSKB);
imshow(Imagen_8PSK_Transmitida100SNR)
title('Imagen Transmitida y Comprimida al 35%')
%% Salida del Bloques 8PSK con Codificacion Diferencial de Fuente
IR_DIFF_8PSKR = uint8(reshape(IR_DIFF_PSKB(1:end-1),LAT,LONG) );
IR_DIFF_8PSKG =uint8(reshape(IR_DIFF_PSKG(1:end-1),LAT,LONG)) ;
IR_DIFF_8PSKB = uint8(reshape(IR_DIFF_PSKR(1:end-1),LAT,LONG)) ;
%% Visualizacion de la imagen final con Codificacion de Fuente
figure('Name','Visualizaci�n Imagen Transmitida con Codificacion de Fuente ')
Imagen__DIFF_8PSK_Transmitida100SNR = cat(3,IR_DIFF_8PSKR,IR_DIFF_8PSKG, IR_DIFF_8PSKB);
imshow(Imagen_8PSK_Transmitida100SNR)
title('Imagen Transmitida y Comprimida al 35% con 100 EbNo')



%% *************************************************************************************************************************************
%% Bloque con exceso de ruido 60dB EBn0

truImage601 = uint8(reshape(imagenTOTAL1D(1:end-1,1),LAT,LONG)) ;
truImage602 = uint8(reshape(imagenTOTAL1D(1:end-1,2),LAT,LONG)) ;
truImage603 = uint8(reshape(imagenTOTAL1D(1:end-1,3),LAT,LONG)) ;
figure('Name','Visualizaci�n Imagen Transmitida con Codificacion de Fuente ebN0 de 60 dB ')
truImage60= cat(3,truImage601, truImage602, truImage603);
imshow(truImage60)
title('Imagen Transmitida y Comprimida al 35% con 60 EbNo')
%% *************************************************************************************************************************************
%% Bloque con exceso de ruido 65dB EBn0

truImage65A = uint8(reshape(imagenTOTAL4(1:end-1,1),LAT,LONG)) ;
truImage65B= uint8(reshape(imagenTOTAL4(1:end-1,2),LAT,LONG)) ;
truImage65C = uint8(reshape(imagenTOTAL4(1:end-1,3),LAT,LONG)) ;
figure('Name','Visualizaci�n Imagen Transmitida con Codificacion de Fuente ebN0 de 65 dB ')
truImage65ABC= cat(3,truImage65A, truImage65B, truImage65C);
imshow(truImage65ABC)
title('Imagen Transmitida y Comprimida al 35% con 65 EbNo')
%%
truImage651 = uint8(reshape(imagenTOTAL4d(1:end-1,1),LAT,LONG)) ;
truImage652 = uint8(reshape(imagenTOTAL4d(1:end-1,2),LAT,LONG)) ;
truImage653 = uint8(reshape(imagenTOTAL4d(1:end-1,3),LAT,LONG)) ;
figure('Name','Visualizaci�n Imagen Transmitida con Codificacion de Fuente ebN0 de 65 dB ')
truImage65= cat(3,truImage651, truImage652, truImage653);
imshow(truImage65)
title('Imagen Transmitida y Comprimida al 35% con 65 EbNo')

%% *************************************************************************************************************************************
%% Bloque con 85dB EBn0 

truImage85A = uint8(reshape(imagenTOTAL4(1:end-1,1),LAT,LONG)) ;
truImage85B= uint8(reshape(imagenTOTAL4(1:end-1,2),LAT,LONG)) ;
truImage85C = uint8(reshape(imagenTOTAL4(1:end-1,3),LAT,LONG)) ;
figure('Name','Visualizaci�n Imagen Transmitida con Codificacion de Fuente ebN0 de 85 dB ')
truImage85ABC= cat(3,truImage85A, truImage85B, truImage85C);
imshow(truImage85ABC)
title('Imagen Transmitida y Comprimida al 35% con 85 EbNo')
%%
truImage851 = uint8(reshape(imagenTOTAL4D(1:end-1,1),LAT,LONG)) ;
truImage852 = uint8(reshape(imagenTOTAL4D(1:end-1,2),LAT,LONG)) ;
truImage853 = uint8(reshape(imagenTOTAL4D(1:end-1,3),LAT,LONG)) ;
figure('Name','Visualizaci�n Imagen Transmitida con Codificacion de Fuente ebN0 de 85 dB ')
truImage85= cat(3,truImage851, truImage852, truImage853);
imshow(truImage85)
title('Imagen Transmitida y Comprimida al 35% con 85 EbNo')

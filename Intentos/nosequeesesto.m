imagen_bocachica = imread('boca_chica.jpg');
imagen_bocachica2 = double(imagen_bocachica);
clearvars imagen_bocachica4 imagen_bocachicaB imagen_bocachicaG imagen_bocachicaR
LAT = size(imagen_bocachica,1)
LONG = size(imagen_bocachica,2)
HOR = size(imagen_bocachica,1)*size(imagen_bocachica,2)
imagen_bocachica3 = reshape(imagen_bocachica2 ,HOR,3);

% Primera Capa de Color
% R es la capa roja de la imagen
imagen_bocachicaR = (reshape(imagen_bocachica2(:,:,1) ,HOR,1)) ;
% G y B corresponden a verde y azul respectivamente
imagen_bocachicaG = (reshape(imagen_bocachica2(:,:,2) ,HOR,1)) ;
imagen_bocachicaB = (reshape(imagen_bocachica2(:,:,3) ,HOR,1)) ;


%% Realizando cuantizacion de la imagen Roja
AmpMaxR = max(max(imagen_bocachicaR ));
AmpMinR = min(min(imagen_bocachicaR ));
vectorwowR = AmpMin:(abs(AmpMin)+abs(AmpMax))/255:AmpMax;
vectorR = sort(vectorwow);
[roswR,coslsR] = sort(vector);



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

%%  Cuantizaci�n 256-PAM:
clear   j bin  imagen_bocachicaR2 i
bin = 1:length(imagen_bocachicaR);
for j = 1:length(imagen_bocachicaR);
    for i = 1:256-1; % Cantidad de niveles de cuantizacion hasta el ultimo
        if vector(i) < imagen_bocachicaR(j) & vector(i+1) > imagen_bocachicaR(j)
            % Caso superior al minimo
            imagen_bocachicaR2(j) = vector(i+1); % Se cuantiza hacia arriba
        elseif vector(i+1) == imagen_bocachicaR(j)
            imagen_bocachicaR2(j) = vector(i+1);
            
        end
    end
end
%% Transformacion de la imagen en bits

for i = 1:length(imagen_bocachicaR2);
    for j = 1:length(vector);
        if imagen_bocachicaR2(i) == vector(j);
            orden(i) = cosls(j); 
        end
    end
end
orden(orden == 0) = 1;
orden(orden == 256) = 255;


%% Segmentador de Bits

clearvars u1 i j orden2  

i = 1;
orden2 = orden;
t = 1;
for i = 1:size(orden2,2) % DEC correspondiente
        
        u1(i,1)  =   Todos_los_8bits_tipo3(orden2(i)+1,1);
        u1(i,2)=     Todos_los_8bits_tipo3(orden2(i)+1,2);
        u1(i,3)=     Todos_los_8bits_tipo3(orden2(i)+1,3);
        u1(i,4)=     Todos_los_8bits_tipo3(orden2(i)+1,4);
        u1(i,5)=     Todos_los_8bits_tipo3(orden2(i)+1,5);
        u1(i,6)=     Todos_los_8bits_tipo3(orden2(i)+1,6);
        u1(i,7)=     Todos_los_8bits_tipo3(orden2(i)+1,7);
        u1(i,8)=     Todos_los_8bits_tipo3(orden2(i)+1,8);
end

%% Importando la imagen al modelo
% Se opera el sampling time 
clearvars ts i ts2
% Se tienen 420800 muestras... se busca enviar todas en 1 segundo
% 1/420800

Fs = 420800
NyquistFs = 2*Fs;
NyquistTs =  5 /NyquistFs;
NyquistTimeInterval = (1:NyquistTs:5);

contador = (1:420800)';
Imagen_REntrada = [contador imagen_bocachicaR];
Imagen_GEntrada = [contador imagen_bocachicaG];
Imagen_BEntrada = [contador imagen_bocachicaB];

%% Salida del Bloque
IR8PSK = reshape(IRS8PSK(1:end-1),LAT,LONG) ;
IR8PSK1 = reshape(IRS8PSK1(1:end-1),LAT,LONG) ;

%% Salidas de Bloque para capas Verde y Azul
IGS = (reshape(Imagen_REntrada(:,2),LAT,LONG)) ;
IBS = (reshape(Imagen_REntrada(:,2),LAT,LONG)) ;










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

%% Transformacion de la imagen en bits

for i = 1:length(imagen_bocachicaR2);
    for j = 1:length(vectorR);
        if imagen_bocachicaR2(i) == vectorR(j);
            ordenR(i) = coslsR(j); 
        end
    end
end
ordenR(ordenR == 0) = 1;
ordenR(ordenR == 256) = 255;


%% Segmentador de Bits

clearvars u1R i j orden2R  

i = 1;
orden2R = ordenR;
t = 1;
for i = 1:size(orden2R,2) % DEC correspondiente
        
        u1R(i,1)  =   Todos_los_8bits_tipo3(orden2R(i)+1,1);
        u1R(i,2)=     Todos_los_8bits_tipo3(orden2R(i)+1,2);
        u1R(i,3)=     Todos_los_8bits_tipo3(orden2R(i)+1,3);
        u1R(i,4)=     Todos_los_8bits_tipo3(orden2R(i)+1,4);
        u1R(i,5)=     Todos_los_8bits_tipo3(orden2R(i)+1,5);
        u1R(i,6)=     Todos_los_8bits_tipo3(orden2R(i)+1,6);
        u1R(i,7)=     Todos_los_8bits_tipo3(orden2R(i)+1,7);
        u1R(i,8)=     Todos_los_8bits_tipo3(orden2R(i)+1,8);
end

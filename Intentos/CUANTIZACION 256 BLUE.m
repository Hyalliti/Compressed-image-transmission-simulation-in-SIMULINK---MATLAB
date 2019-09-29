
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

%% Transformacion de la imagen en bits

for i = 1:length(imagen_bocachicaB2);
    for j = 1:length(vectorB);
        if imagen_bocachicaB2(i) == vectorB(j);
            ordenB(i) = coslsB(j); 
        end
    end
end
ordenB(ordenB == 0) = 1;
ordenB(ordenB == 256) = 255;


%% Segmentador de Bits

clearvars u1B i j orden2B  

i = 1;
orden2B = ordenB;
t = 1;
for i = 1:size(orden2B,2) % DEC correspondiente
        
        u1B(i,1)  =   Todos_los_8bits_tipo3(orden2B(i)+1,1);
        u1B(i,2)=     Todos_los_8bits_tipo3(orden2B(i)+1,2);
        u1B(i,3)=     Todos_los_8bits_tipo3(orden2B(i)+1,3);
        u1B(i,4)=     Todos_los_8bits_tipo3(orden2B(i)+1,4);
        u1B(i,5)=     Todos_los_8bits_tipo3(orden2B(i)+1,5);
        u1B(i,6)=     Todos_los_8bits_tipo3(orden2B(i)+1,6);
        u1B(i,7)=     Todos_los_8bits_tipo3(orden2B(i)+1,7);
        u1B(i,8)=     Todos_los_8bits_tipo3(orden2B(i)+1,8);
end


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

%% Transformacion de la imagen en bits

for i = 1:length(imagen_bocachicaG2);
    for j = 1:length(vectorG);
        if imagen_bocachicaG2(i) == vectorG(j);
            ordenG(i) = coslsG(j); 
        end
    end
end
ordenG(ordenG == 0) = 1;
ordenG(ordenG == 256) = 255;


%% Segmentador de Bits

clearvars u1G i j orden2G  

i = 1;
orden2G = ordenG;
t = 1;
for i = 1:size(orden2G,2) % DEC correspondiente
        
        u1G(i,1)  =   Todos_los_8bits_tipo3(orden2G(i)+1,1);
        u1G(i,2)=     Todos_los_8bits_tipo3(orden2G(i)+1,2);
        u1G(i,3)=     Todos_los_8bits_tipo3(orden2G(i)+1,3);
        u1G(i,4)=     Todos_los_8bits_tipo3(orden2G(i)+1,4);
        u1G(i,5)=     Todos_los_8bits_tipo3(orden2G(i)+1,5);
        u1G(i,6)=     Todos_los_8bits_tipo3(orden2G(i)+1,6);
        u1G(i,7)=     Todos_los_8bits_tipo3(orden2G(i)+1,7);
        u1G(i,8)=     Todos_los_8bits_tipo3(orden2G(i)+1,8);
end

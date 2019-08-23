close all
clear all
clc

%% ************ AQUISIÇÃO DE DADOS E DEFINIÇÕES INICIAIS ******************
tic;
ne          = 8;    %números de entrada     
ns          = 1;     %números de saída
n           = ne+ns;  %base de dados total

dadosO = load('grupo5.txt'); %Representa a saída em binários
dados = normalizaDados(dadosO,ne); %função normaliza dados
dados = [dados dadosO(:,ne+1:n)];


tam         = size(dados); %tamanho da entrada
qtdAmostras = tam(1); 

percTrein   = 75;
qtdTrein    = round(qtdAmostras*percTrein*0.01); %arrendodar valores
qtdTeste    = qtdAmostras-qtdTrein;
for teste=1:5
acertos                 = 0;
dados                   = mixData(dados,qtdAmostras);
[conjTrein, conjTeste]  = divideData(dados,qtdAmostras,qtdTrein);

entradaTrein             = conjTrein(:,1:ne);
saidaTrein               = conjTrein(:,ne+1:ne+ns);
entradaTeste             = conjTeste(:,1:ne);
saidaTeste               = conjTeste(:,ne+1:ne+ns);

x=[3,4,5,6,7];

dp = zeros(qtdTeste,qtdTrein);
dists = zeros(1,qtdTrein);
%for testRowNumber=1:qtdTeste
for r=1:qtdTeste
%testfigure = entradaTeste(r,:);
test_ent = entradaTeste(r,:);
 %Calcula-se a distância de cada linha de teste por todas as linhas de
 %treinamento
for i=1 : qtdTrein
  dists(i) = cosineDistance(test_ent,entradaTrein(i,:));
end
[d,ind] = sort(dists);
dp(r,:)= ind; % Todos os indices das menores distância entre a entrada de Teste e todas de Treinamento
end

for i=1:5
k=x(i);
acertos = 0;
for p=1:qtdTeste
ind_knn = dp(p,:);
knn = ind_knn(1:k); %Pegando os k viznhos mais próximos
knn = saidaTrein(knn,:);
resul_teste = mode(knn);
acert_class = saidaTeste(p,1);

if(resul_teste==acert_class)
    acertos = acertos +1;
end

end
%Resultados
y1(teste, i)= acertos*100/qtdTeste;
erro(teste, i) = 100 - y1(i);
% fprintf('\n Taxa de Acerto: %f %  = ', y1(i))
% fprintf('para k: %f %  = ', k)
end
end
for i=1:5
media_acerto(i) = mean(y1(:,i))
media_erro(i) = mean(erro(:,i));
%desviop(i)= std(y1(:, i))
end
tempo = toc
% figure (1)
% plot(x,media_erro,'b')
% title('Taxa de Erro - Knn')
% xlabel('Número de Vizinhos nn')
% ylabel('Erro')
% 
% figure (2)
% plot(x,media_acerto,'r')
% title('Taxa de Acerto - Knn')
% xlabel('Número de Vizinhos nn')
% ylabel('Acerto')


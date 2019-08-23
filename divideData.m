function [conjTrein , conjTeste] = divideData(dados,qtdAmostras,qtdTrein)

         conjTrein       = dados(1:qtdTrein,:);
         conjTeste       = dados(qtdTrein+1:qtdAmostras,:);

end
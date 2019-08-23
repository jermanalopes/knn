function [dados] = normalizaDados(dados,ne)

    data       = dados(:,1:ne);
    tam        = size(data);
    qtdPadroes = tam(1);
    
    

    media   = mean(data);
    desvio  = std(data);
    data    = (data - repmat(media,qtdPadroes,1))./repmat(desvio,qtdPadroes,1);
    dados   = [ data dados(:,ne+1:tam(2)) ];
    


end

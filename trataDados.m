function [dados] = trataDados(arquivo)
dados = importdata(arquivo);
tam = size(dados);
qtdPadroes = tam(1);
saida      = tam(2);

for k=1:1:qtdPadroes
    
    saidaDes = dados(k,saida);
    
    if( saidaDes == 1)
        dados(k,saida:saida+5) =  [1 0 0 0 0 0 ];
    end
    
    if(saidaDes == 2)
        dados(k,saida:saida+5) =  [0 1 0 0 0 0 ];
    end
    
    if(saidaDes == 3)
        dados(k,saida:saida+5) =  [0 0 1 0 0 0 ];
    end
    
    if(saidaDes == 4)
        dados(k,saida:saida+5) =  [0 0 0 1 0 0 ];
    end
    
    if(saidaDes == 5)
        dados(k,saida:saida+5) =  [0 0 0 0 1 0 ];
    end
    
    if(saidaDes == 6)
        dados(k,saida:saida+5) =  [0 0 0 0 0 1 ];
    end
end
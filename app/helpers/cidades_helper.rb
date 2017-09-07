module CidadesHelper
    def cidade(id)
        cidade = Cidade.find(id)
        "#{ ' localização ' }#{ cidade.nome }"
        
    end
end

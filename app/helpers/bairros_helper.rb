module BairrosHelper
    def bairro(id)
        bairro = Bairro.find(id)
        "#{ ' bairro ' }#{ bairro.nome }"
    end
end

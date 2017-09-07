module TiposHelper
    def tipo(id)
        tipo = Tipo.find(id)
        "#{tipo.nome}#{ ' para ' }"
    end
end

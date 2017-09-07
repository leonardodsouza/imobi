module CategoriasHelper
    def categoria(id)
        categoria = Categoria.find(id)
        categoria.nome
    end
end

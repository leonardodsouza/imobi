json.extract! anuncio, :id, :nome, :email, :telefone, :cidade, :bairro, :categoria, :tipo, :dormitorios, :banheiros, :garagem, :area, :valor, :descricao, :created_at, :updated_at
json.url anuncio_url(anuncio, format: :json)

class EmailsMailer < ActionMailer::Base
    default from: "humanize@humanizerh.com.br"
    
    def contato(cliente)
        @cliente = cliente.nome
        @email = cliente.email
        @telefone = cliente.telefone
        @mensagem = cliente.mensagem
        mail(to: 'imob.buenosaires@hotmail.com', subject: 'Contato vindo do site')
    end

    def informacoes(cliente, link)
        @imovel = cliente.imovel_id
        @cliente = cliente.nome
        @email = cliente.email
        @telefone = cliente.telefone
        @mensagem = cliente.mensagem
        @link = link
        mail(to: 'imob.buenosaires@hotmail.com', subject: 'Solicitação de mais informações')
    end

    def favoritos(cliente, link)
        @imovel = cliente.imovel_id
        @cliente = cliente.nome
        @email = cliente.email
        @link = link
        mail(to: @email, subject: 'Imobiliária Buenos Aires')
    end

    def anuncios(anuncio)
        @cliente = anuncio.nome
        @email = anuncio.email
        @telefone = anuncio.telefone
        @cidade = anuncio.cidade
        @bairro = anuncio.bairro
        @categoria = anuncio.categoria
        @tipo = anuncio.tipo
        @dormitorios = anuncio.dormitorios
        @banheiros = anuncio.banheiros
        @garagem = anuncio.garagem
        @area = anuncio.area
        @valor = anuncio.valor
        @descricao = anuncio.descricao
        mail(to: 'imob.buenosaires@hotmail.com', subject: 'Solicitação para anúncio')
    end

end
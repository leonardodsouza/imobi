module SituacoesHelper
    def situacao(id, nome)
        case id
          when 1
            content_tag(:strong, nome, style: "color: #4169E1;")
          when 2
            content_tag(:strong, nome, style: "color: #FF6347;")
          when 3
            content_tag(:strong, nome, style: "color: #FF0000;")
        end
    end
end

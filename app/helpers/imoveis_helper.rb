module ImoveisHelper
    def situacao(id)
        case id
            when 1
            content_tag(:div, nil, class: "")
            when 2
            content_tag(:div, nil, class: "")
            when 3
            content_tag(:div, 'Vendido', class: "alert alert-danger", role: "alert")
            when 4
            content_tag(:div, nil, class: "")
        end
    end
end

module ApplicationHelper
    def number_to_currency_br(number)
        if number.present?
            number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".")
        else
            "a combinar"
        end
    end
end

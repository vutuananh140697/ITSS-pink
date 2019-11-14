module ApplicationHelper
    def date_string_for(datetime)
        datetime.strftime("%b %e, %Y")
    end
end

module ApplicationHelper
    def auth_token
        "#{form_authenticity_token}".html_safe
    end
end

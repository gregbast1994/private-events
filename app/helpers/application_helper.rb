module ApplicationHelper
    def base_title(title)
        base = "Private Events"
        title.empty? ? base : title + ' | ' + base
    end
end

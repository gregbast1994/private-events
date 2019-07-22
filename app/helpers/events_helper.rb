module EventsHelper
    def event_image(event)
        if event.thumbnail?
            image_tag event.thumbnail.url, class: 'card-img-top'
        else
            image_tag 'https://via.placeholder.com/100x50', class: 'card-img-top'
        end
    end

end

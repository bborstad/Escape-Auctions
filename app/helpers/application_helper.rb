module ApplicationHelper
    def auction_image(auction_id)
        auction = Auction.find(auction_id)
        if auction.image.attached?
            image_tag auction.image, style: "height: 200px; width: 100%"
        else
            image_tag "default.jpg",style: "height: 200px; width: 100%"
        end
    end
end

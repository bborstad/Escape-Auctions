class AuctionsController < ApplicationController
    def index
        auctions = Auction.all
        respond_to do |format|
            format.html { render :index, locals: {auctions: auctions } }
        end
    end

    def edit
    end

    def delete
    end
end

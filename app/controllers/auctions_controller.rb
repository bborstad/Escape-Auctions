class AuctionsController < ApplicationController
    def index
        auctions = Auction.includes(:user).all
        respond_to do |format|
            format.html { render :index, locals: {auctions: auctions } }
        end
    end
end

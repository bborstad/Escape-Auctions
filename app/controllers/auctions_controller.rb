class AuctionsController < ApplicationController
    def index
        auctions = Auction.includes(:user).all
        respond_to do |format|
            format.html { render :index, locals: {auctions: auctions } }
        end
    end

    def show
        auction = Auction.find(params[:id])
        respond_to do |format|
            format.html { render :show, locals: { auction: auction } }
        end
    end

    def search
    end
end

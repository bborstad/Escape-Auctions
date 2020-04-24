class UserReviewsController < ApplicationController

    def index
        auctions = current_user.auctions
        respond_to do |format|
            format.html { render :index, locals: {auctions: auctions } }
        end
    end
    
    def submission
        respond_to do |format|
            format.html {render :submission}
        end
    end

    def update
        respond_to do |format|
            format.html {render :submission}
        end
    end

     
end
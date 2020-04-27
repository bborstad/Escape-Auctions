class BidsController < ApplicationController
  def create
    bid = current_user.bids.build(params.require(:bid).permit(:amount, :auction))
    respond_to do |format|
      format.html do
        if bid.save
          flash[:success] = "bid created successfully"
          render :new, locals: { auction: auction }
        else
          flash.now[:error] = "Error: Auction could not be created"
          render :new, locals: { auction: auction }
        end
      end
    end
  end

  def show
    bids = current_user.bids
    auctions = Auction.where(id: bids.select(:auction_id))
    respond_to do |format|
      format.html { render :show, locals: {auctions: auctions } }
    end
  end
end

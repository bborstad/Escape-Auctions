class BidsController < ApplicationController
  def create
    bid = current_user.bids.build(params.require(:bid).permit(:amount, :auction))
    respond_to do |format|
      format.html do
        if bid.save
          flash[:success] = "Success: Bid placed."
          render :new, locals: { auction: auction }
        else
          flash.now[:error] = "Error: Bid could not be placed."
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

class BidsController < ApplicationController
  
  before_action :authenticate_user!
 # before_action :require_permission, only: [:show, :create]

  def create
    # bid = current_user.bids.build(params.require(:bid).permit(:amount))


    auction = Auction.find(params[:id])
    amount = params[:amount]
    highest = auction.bids.order(amount: :desc).first
    if highest.present?
      highest_bid = highest.amount
    else
      highest_bid = auction.starting_bid
    end
    if amount.to_f <= highest_bid
      flag = 1
    else
      bid = Bid.new(
          user_id: current_user.id,
          amount: amount,
          auction_id: params[:id],
      )
    end
    respond_to do |format|
      format.html do
        if flag == 1
          flash[:error] =  "Error: Bid can not be lower than previous bids."
              redirect_to "/auctions/#{auction.id}"
        elsif bid.save
          flash[:success] = "Success: Bid placed."
          redirect_to "/auctions/#{auction.id}"
        else
          flash[:error] =  "Error: Bid could not be placed."
          redirect_to "/auctions/#{auction.id}"
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

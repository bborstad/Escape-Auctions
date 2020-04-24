class UserAuctionsController < ApplicationController
 
  before_action :authenticate_user!
  before_action :require_permission, only: [:show, :edit, :update, :destroy]
  
  def index
        auctions = current_user.auctions
        respond_to do |format|
            format.html { render :index, locals: {auctions: auctions } }
        end
    end

    def new
        auction = Auction.new
        respond_to do |format|
          format.html { render :new, locals: { auction: auction } }
        end
    end
      
      def create
        auction = current_user.auctions.build(params.require(:auction).permit(:title, :description, :starting_bid, :buy_now_price, :expire_date, :status))
        respond_to do |format|
          format.html do
            if auction.save
              flash[:success] = "Auction created successfully"
              redirect_to user_auctions_url
            else
              flash.now[:error] = "Error: Auction could not be created"
              render :new, locals: { auction: auction }
            end
          end
        end
      end


    def show
        auction = Auction.find(params[:id])
        respond_to do |format|
            format.html { render :show, locals: { auction: auction } }
        end
    end

    def edit
        auction = Auction.find(params[:id])
        respond_to do |format|
          format.html { render :edit, locals: { auction: auction } }
        end
      end
      
    def update
        auction = Auction.find(params[:id])
            respond_to do |format|
                format.html do
                if auction.update(params.require(:auction).permit(:title, :description, :starting_bid, :buy_now_price, :expire_date, :status))
                    flash[:success] = 'Auction updated successfully'
                    redirect_to user_auctions_url
                else
                    flash.now[:error] = 'Error: Auction could not be updated'
                    render :edit, locals: { auction: auction }
                end
            end
        end
    end

    def destroy
        auction = Auction.find(params[:id])
        auction.destroy
        respond_to do |format|
            format.html do
                flash[:success] = 'Auction deleted successfully'
                redirect_to user_auctions_url
            end
        end
    end

    def require_permission
      if Auction.find(params[:id]).user != current_user
        redirect_to auctions_path, flash: { error: "You do not have permission to do that."}
      end
    end
end

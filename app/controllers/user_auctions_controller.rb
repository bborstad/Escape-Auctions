class UserAuctionsController < ApplicationController
    def index
        auctions = Auction.includes(:user).all
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
        auction = current_user.quizzes.build(params.require(:quiz).permit(:title, :description))
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
                if auction.update(params.require(:auction).permit(:title, :description, :starting_bid, :buy_now_price))
                    #flash[:success] = 'Auction updated successfully'
                    redirect_to user_auctions_url
                else
                    #flash.now[:error] = 'Error: Auction could not be updated'
                    render :edit, locals: { auction: auction }
                end
            end
        end
    end

end

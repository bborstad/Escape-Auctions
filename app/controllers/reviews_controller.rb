class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_permission, only: [:destroy]
  

  def index
    reviews = current_user.reviews
    respond_to do |format|
      format.html {render :index, locals: {reviews:reviews}}
    end
  end 

  def reviewleft
    reviews = Review.where(auction_id: params[:id])
    respond_to do |format|
      format.html {render :reviewleft, locals: {reviews:reviews}}
    end
  end

  def new 
    review = Review.new
    id=params[:id]
    respond_to do |format| 
      format.html {render :new, locals: {review: review,id: id}}
    end 
  end 

  def show
    review = Review.find(params[:id])
    respond_to do |format|
      format.html {render :show, locals: {review:review}}
    end
  end

  def create
    
    review = Review.new(
      name: params[:name],
      email: params[:email],
      message: params[:message],
      auction_id: params[:id],
      user_id: current_user.id
    )
    
    respond_to do |format|
      format.html do
    if review.save!
      flash[:success] = "Review saved successfully"
      redirect_to reviews_url
    else
      flash.now[:error] = "Error: Review could not be saved"
      render :new, locals: { review: review }
      end
    end   
  end 
end 


def destroy
  review = Review.find(params[:id])
  review.destroy
  respond_to do |format|
      format.html do
          flash[:success] = 'Review deleted successfully'
          redirect_to reviews_url
      end
  end
end



def require_permission
  if Review.find(params[:id]).user != current_user
    redirect_to reviews_path, flash: { error: "You do not have permission to do that."}
  end
end

end

class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    reviews = Review.all
    respond_to do |format|
      format.html {render :index, locals: {reviews:reviews}}
    end
  end 

  def new 
    review = Review.new
    respond_to do |format|
      format.html {render :new, locals: {review: review}}
    end 
  end 

    def show
      review = Review.find(params[:id])
      respond_to do |format|
        format.html {render :show, locals: {review:review}}
      end
    end

  def create
    review = Review.new(params.require(:review).permit(:name, :email, :message,))
    respond_to do |format|
      format.html do
    if review.save
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

end

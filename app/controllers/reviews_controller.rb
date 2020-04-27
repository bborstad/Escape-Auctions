class ReviewsController < ApplicationController
  before_action :authenticate_user!\
  
  before_action :set_review, only: :new
  def index
    reviews = Review.all
    respond_to do |format|
      format.html {render :index, locals: {reviews:reviews}}
  end
end 

  def show
    review = Review.find(params[:id])
    respond_to do |format|
      format.html {render :show, locals: {review:review}}
  end
end

  def new 
    review = Review.new
    respond_to do |format|
      format.html {render :new, locals: {review: review}}
    end 
  end 

  def create
    review = Review.new(params.require(:review).permit(:name, :email, :message,))
    respond_to do |format|
      format.html {
    if review.save
      flash[:success] = "Review saved successfully"
      redirect_to index_review_url
    else
      flash.now[:error] = "Error: Review could not be saved"
      render :new, locals: { review: review }
    end
  }
  end

end 
end 

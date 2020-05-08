class SearchController < ApplicationController
  def search
    if params[:search].blank?
      flash[:warn] = "please put something in the search bar to search"
      redirect_to auctions_url
    else
      @parameter = params[:search].downcase
      @results = Auction.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
    end
  end
end

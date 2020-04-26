class SearchController < ApplicationController
  def search
    if params[:search].blank?
      redirect_to(auctions_path) and return
    else
      @parameter = params[:search].downcase
      @results = Auction.all.where("lower(title) LIKE :search", search: "%#{@parameter}%")
    end
  end
end

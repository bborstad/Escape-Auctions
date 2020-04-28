class AddAuctionsFkColToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :auctions, foreign_key: true
  end
end

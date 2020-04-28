class AddAuctionIdToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :auction_id, :integer
  end
end

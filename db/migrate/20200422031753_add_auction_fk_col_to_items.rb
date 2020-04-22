class AddAuctionFkColToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :auction, foreign_key: true
  end
end

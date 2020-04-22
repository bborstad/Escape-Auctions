class AddDescriptionToAuction < ActiveRecord::Migration[6.0]
  def change
    add_column :auctions, :description, :text
  end
end

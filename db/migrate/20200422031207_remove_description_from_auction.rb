class RemoveDescriptionFromAuction < ActiveRecord::Migration[6.0]
  def change

    remove_column :auctions, :description, :text
  end
end

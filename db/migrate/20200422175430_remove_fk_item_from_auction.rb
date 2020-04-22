class RemoveFkItemFromAuction < ActiveRecord::Migration[6.0]
  def change
    def change
      remove_reference :item, :auction, index: true, foreign_key: true
    end
  end
end

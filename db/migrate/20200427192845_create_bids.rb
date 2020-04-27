class CreateBids < ActiveRecord::Migration[6.0]
  def change
    create_table :bids do |t|
      t.decimal :amount
      t.timestamps
    end
    add_reference :bids, :auction, foreign_key: true
    add_reference :bids, :user, foreign_key: true
  end
end

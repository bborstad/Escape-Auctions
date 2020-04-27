class CreateAuctions < ActiveRecord::Migration[6.0]
  def change
    create_table :auctions do |t|
      t.string :title
      t.text :description
      t.float :starting_bid
      t.float :buy_now_price
      t.boolean :status, :default => true
      t.date :expire_date

      t.timestamps
    end
  end
end

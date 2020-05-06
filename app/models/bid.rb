# == Schema Information
#
# Table name: bids
#
#  id         :bigint           not null, primary key
#  amount     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  auction_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_bids_on_auction_id  (auction_id)
#  index_bids_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (auction_id => auctions.id)
#  fk_rails_...  (user_id => users.id)
#
class Bid < ApplicationRecord
  belongs_to(
      :user,
      class_name: 'User',
      foreign_key: 'user_id',
      inverse_of: :bids
  )
  belongs_to(
      :auction,
      class_name: 'Auction',
      foreign_key: 'auction_id',
      inverse_of: :bids
  )

  validates :amount, 
    presence: true,
    numericality: { greater_than: 0 }
end

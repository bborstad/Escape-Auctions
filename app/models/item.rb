# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  auction_id  :bigint
#
# Indexes
#
#  index_items_on_auction_id  (auction_id)
#
# Foreign Keys
#
#  fk_rails_...  (auction_id => auctions.id)
#
class Item < ApplicationRecord
    belongs_to :auction, :class_name => 'Auction', :foreign_key => 'auction_id'
end

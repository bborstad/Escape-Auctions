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
require 'test_helper'

class BidTest < ActiveSupport::TestCase
  #Presence tests
  test "bid presence not valid" do
    b = bids(:one)
    b.amount = nil
    assert_not b.valid?
  end

  #Numericality tests
  test "bid value greater than 0" do
    b = bids(:two)
    b.amount = -1
    assert_not b.valid?
    b.amount = 0
    assert_not b.valid?
  end
  
end

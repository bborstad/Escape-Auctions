# == Schema Information
#
# Table name: auctions
#
#  id            :bigint           not null, primary key
#  buy_now_price :float
#  description   :text
#  expire_date   :date
#  starting_bid  :float
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint
#
# Indexes
#
#  index_auctions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class AuctionTest < ActiveSupport::TestCase
  #Presence tests
  test "title presence not valid" do
    a = auctions(:one)
    a.title = nil
    assert_not a.valid?
    a.title = ""
    assert_not a.valid?
  end
  
  test "starting_bid presence not valid" do
    a = auctions(:one)
    a.starting_bid = nil
    assert_not a.valid?
    a.starting_bid = ""
    assert_not a.valid?
  end
  
  test "buy_now_price presence not valid" do
    a = auctions(:one)
    a.buy_now_price = nil
    assert_not a.valid?
    a.buy_now_price = ""
    assert_not a.valid?
  end
  
  test "expire_date presence not valid" do
    a = auctions(:one)
    a.expire_date = nil
    assert_not a.valid?
    a.expire_date = ""
    assert_not a.valid?
  end

  test "expire_date cannot be before today" do
    a = auctions(:one)
    a.expire_date = nil
    assert_not a.valid?
    a.expire_date = "2020-01-01"
    assert_not a.valid?
  end

  #Numericality tests
  test "starting_bid value greater than or equal to 0" do
    a = auctions(:two)
    a.starting_bid = -1
    assert_not a.valid?
    a.starting_bid = 1
    assert_not a.valid?
  end

  test "buy_now_price value greater than 0" do
    a = auctions(:two)
    a.buy_now_price = -1
    assert_not a.valid?
    a.buy_now_price = 0
    assert_not a.valid?
  end

end

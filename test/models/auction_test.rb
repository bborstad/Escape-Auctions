# == Schema Information
#
# Table name: auctions
#
#  id            :bigint           not null, primary key
#  buy_now_price :float
#  description   :text
#  expire_date   :date
#  starting_bid  :float
#  status        :boolean
#  title         :string
#  winning_bid   :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'test_helper'

class AuctionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

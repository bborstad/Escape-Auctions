# == Schema Information
#
# Table name: reviews
#
#  id          :bigint           not null, primary key
#  email       :string
#  message     :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  auction_id  :integer
#  auctions_id :bigint
#  user_id     :integer
#  users_id    :bigint
#
# Indexes
#
#  index_reviews_on_auctions_id  (auctions_id)
#  index_reviews_on_users_id     (users_id)
#
# Foreign Keys
#
#  fk_rails_...  (auctions_id => auctions.id)
#  fk_rails_...  (users_id => users.id)
#
require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "email presence not valid" do
    r = reviews(:one)
    r.email = nil
    assert_not r.valid?
    r.email = ""
    assert_not r.valid?
  end
  
  test "message presence not valid" do
    r = reviews(:one)
    r.message = nil
    assert_not r.valid?
    r.message = ""
    assert_not r.valid?
  end
  
  test "name presence not valid" do
    r = reviews(:one)
    r.name = nil
    assert_not r.valid?
    r.name = ""
    assert_not r.valid?
  end
  
end

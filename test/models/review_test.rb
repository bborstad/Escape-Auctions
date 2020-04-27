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
#  auctions_id :bigint
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
  # test "the truth" do
  #   assert true
  # end
end

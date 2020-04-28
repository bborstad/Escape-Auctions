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
class Review < ApplicationRecord
    belongs_to(
        :user,
        optional: true, 
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :reviews
    )
    belongs_to(
        :auction,
        optional: true, 
        class_name: 'Auction',
        foreign_key: 'auction_id',
        inverse_of: :reviews
    )


 
end

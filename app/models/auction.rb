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
class Auction < ApplicationRecord
    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :auctions
    )


end
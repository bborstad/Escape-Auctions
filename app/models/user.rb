# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  password   :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    has_many(
        :auctions,
        class_name: 'Auction',
        foreign_key: 'user_id',
        inverse_of: :user
    )

end

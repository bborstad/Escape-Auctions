# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  email      :string
#  message    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Review < ApplicationRecord
end

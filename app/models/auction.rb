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
class Auction < ApplicationRecord
    has_many :bids

    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :auctions
    )
    has_many :reviews

    acts_as_taggable_on :tags

    has_one_attached :image

    attr_accessor :seed_flag

    after_commit :image_nil, on: [:create, :update]

    private def image_nil
        unless seed_flag
            unless image.attached?
                self.image.attach(io: File.open(Rails.root.join("app", "assets", "images", "default.png")), filename: 'default.png', content_type: 'image/png')
            end
        end
    end

    #Expired auctions
    scope :expired_auctions, -> { where('expire_date < ?', Time.current.beginning_of_day) }
    #Active auctions
    scope :active_auctions, -> { where('expire_date > ?', Time.current.beginning_of_day) }

    def is_expired?
        if expire_date < Time.current.beginning_of_day
            return true
        else
            return false
        end
    end

    def expiration_date_cannot_be_in_the_past
        errors.add(:expire_date, "can't be in the past") if
          !expire_date.blank? and expire_date < Date.today
    end
    
    #Validations
    validates :title, presence: true

    validates :starting_bid,
        presence: true,
        numericality: { greater_than_or_equal_to: 0 }

    validates :buy_now_price,
        presence: true,
        numericality: { greater_than: 0 }
    
    #Format: year-month-date
    validates :expire_date, presence: true 

    validate :expiration_date_cannot_be_in_the_past
      

end

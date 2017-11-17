class Offer < ApplicationRecord
  belongs_to :business
  has_many :items, through: :business, dependent: :destroy

  validates :business_id, presence: true
end

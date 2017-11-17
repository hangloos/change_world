class Business < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :offers
  
  validates :name, presence: true
end

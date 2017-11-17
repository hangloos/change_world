class Item < ApplicationRecord
  belongs_to :business
  has_many :offers, through: :business, dependent: :destroy
  
  validates :name, :price, presence: true
end

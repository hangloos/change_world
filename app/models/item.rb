class Item < ApplicationRecord
  belongs_to :business
  
  validates :name, :price, presence: true
end

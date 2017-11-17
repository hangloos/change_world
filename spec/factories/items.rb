FactoryGirl.define do
  factory :item do
    type ""
    name {Faker::Food.dish}
    price {Faker::Commerce.price}
  end
end

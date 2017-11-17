  require 'rails_helper'
  
  RSpec.describe Offer, type: :model do


    context 'validations' do
      it {should validate_presence_of(:business_id)}
    end

    context 'relationshps' do
      it { should belong_to(:business)}
      it { should have_many(:items).dependent(:destroy)}
    end
  end
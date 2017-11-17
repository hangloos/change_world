  require 'rails_helper'
  
  RSpec.describe Item, type: :model do


    context 'validations' do
      it {should validate_presence_of(:name)}
      it {should validate_presence_of(:price)}
    end

    context 'relationshps' do
      it { should belong_to(:business)}
      it { should have_many(:offers).dependent(:destroy)}
    end
  end
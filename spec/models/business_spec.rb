  require 'rails_helper'
  
  RSpec.describe Business, type: :model do


    context 'validations' do
      it {should validate_presence_of(:name)}
    end

    context 'relationshps' do
      it { should have_many(:items).dependent(:destroy)}
    end
  end
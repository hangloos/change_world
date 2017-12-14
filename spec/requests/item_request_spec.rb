  require 'rails_helper'

  RSpec.describe "Item Api", type: :request do



    # initial data

        let!(:business) {FactoryGirl.create(:business) }
        let!(:items) { FactoryGirl.create_list(:item, 5, business_id: business.id)}
        let(:business_id) { business.id }
        let(:item_id) {items.first.id}

      describe "GET /api/businesses/:business_id/items" do

        context "when business exists" do
          before { get "/api/businesses/#{business_id}/items"}

          it "returns a status code of 200" do
            expect(response).to have_http_status(200)
          end

          it "returns all of the business's items in JSON" do
            expect(json.size).to eq(5)
            expect(json[0][:id]).not_to eq(nil)
          end

        end

        context "when business does not exist" do
          before { get "/api/businesses/10000/items"}

          it "returns a status code of 404" do
            expect(response).to have_http_status(404)
          end

          it "returns all of the business's items in JSON" do
            expect(json).not_to be_empty
            expect(json[:errors][:messages]).to eq({:business=> "can't be found"})
          end

        end

      end






  end
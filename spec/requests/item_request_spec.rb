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


      #post/api/businesses/:business_id/items

      describe ' POST /api/businesses/:business_id/items' do

         describe "when business exists" do

          context 'if params are valid' do

            let(:valid_params) {
              {
              business: {
                  name: "Updated the name",
                  price: 10.5}
  
              }
             } 
            before { post "/api/businesses/#{business_id}/items", params: valid_params}

            it "returns a status code of 201" do
              expect(response).to have_http_status(201)
            end

            it "returns all of the business's items in JSON" do
              expect(json).not_to be_empty
              expect(json[:id]).not_to eq(nil)
              expect(json[:name]).not_to eq(nil)
              expect(json[:price]).not_to eq(nil)
            end
          end

          context 'if params are invalid' do

            let(:invalid_params) {
              {
              business: {
                  name: "",
                  price: ""}
  
              }
             } 
            before { post "/api/businesses/#{business_id}/items", params: invalid_params}
            it 'returns a status code of 422' do
              expect(response).to have_http_status(422)
            end

            it "return error messgaes of not found in JSON" do
            expect(json).not_to be_empty
              expect(json[:errors][:messages]).to eq({:name=>["can't be blank"],
                :price=>["can't be blank"]})
            end
          end

        end

        context "when business does not exist" do
          before { post "/api/businesses/10000/items"}

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
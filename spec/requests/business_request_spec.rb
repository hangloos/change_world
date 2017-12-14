  require 'rails_helper'

  RSpec.describe "Business Api", type: :request do



    # initial data

        let!(:businesses) {FactoryGirl.create_list(:business, 5) }
        let(:business_id) {businesses.first.id}

      describe "GET /api/businesses" do
        
        before { get '/api/businesses'}

        it "returns a status code of 200" do
          expect(response).to have_http_status(200)
        end
         it "returns a collection of business in JSON" do
            expect(json).not_to be_empty
            expect(json.size).to eq(5)
         end
      end

      describe "POST /api/businesses" do

        context "when the request is valid" do

            let(:valid_attributes) {
              {
              business: {
                  name: Faker::Company.name}
  
              }
             } 
          
          before { post '/api/businesses', params: valid_attributes}
          
          it "return a status code of 201" do
            expect(response).to have_http_status(201)
          end
          
          it "creates a business and returns it in JSON" do

            expect(json).not_to be_empty
            expect(json[:id]).not_to eq(nil)
            expect(json[:name]).to eq(valid_attributes[:business][:name])
          end
        end
        
        context "when the request is invalid" do

          before { post '/api/businesses', params: {
            business: {
              name: ''
              }
            } }
          it "returns a status code of 422" do
            expect(response).to have_http_status(422)
          end
          it "returns the validation error messages in JSON" do

            expect(json).not_to be_empty
            expect(json[:errors][:messages]).to eq({:name=>["can't be blank"]})
          end
        end
      end

      describe "GET /api/businesses/:id" do
        context "if business exists" do
        before { get "/api/businesses/#{business_id}"}

        it "returns a status code of 200" do
          expect(response).to have_http_status(200)
        end
         it "returns a business in JSON" do
            expect(json).not_to be_empty
            expect(json[:id]).to eq(business_id)
            expect(json[:name]).to eq(businesses.first.name)
         end
      end
        context "if business does not exist" do
          before { get "/api/businesses/1000" }

          it "returns a status code of 404" do
            expect(response).to have_http_status(404)
          end

          it "returns error messages of not found in JSON" do
            expect(json).not_to be_empty
            expect(json[:errors][:messages]).to eq({
              :business=>"can't be found"
              })
          end
      end
    end


      describe "PUT /api/businesses/:id" do

        describe "if business exits" do

          context "and has valid attributes" do

            let(:valid_attributes) {
              {
              business: {
                  name: "Updated the name"}
  
              }
             } 


            before { put "/api/businesses/#{business_id}", params: valid_attributes}

            it "updates the business" do
              expect(json[:name]).to eq(valid_attributes[:business][:name])
            end

            it "returns a status code of 200" do
              expect(response).to have_http_status(200)
            end
          end


          context "and has invalid attributes" do

            let(:invalid_attributes) {
              {
              business: {
                  name: ""}
  
              }
             } 


            before { put "/api/businesses/#{business_id}", params: invalid_attributes}

            it "updates the business" do
              expect(json).not_to be_empty
              expect(json[:errors][:messages]).to eq({:name=>["can't be blank"]})
            end

            it "returns a status code of 422" do
              expect(response).to have_http_status(422)
            end
          end

        end

         context "if business is not found" do

          let(:valid_attributes) {
              {
              business: {
                  name: "Updated the name"}
  
              }
             } 

          before { put "/api/businesses/1000", params: valid_attributes}

           it "returns a status code 404" do
            expect(response).to have_http_status(404)
           end
          
           it "return error messgaes of not found in JSON" do
            expect(json).not_to be_empty
            expect(json[:errors][:messages]).to eq({
              :business=>"can't be found"
              })
           end
         end
       end













  end
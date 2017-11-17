  require 'rails_helper'

  RSpec.describe 'Business Api', type: :request do

      describe 'GET /api/businesses' do
        
        before { get '/api/businesses'}

        it 'returns a status code of 200' do
          expect(response).to have_http_status(200)
        end
        # it 'returns a collection of business in JSON'

      end

  end





#GET /api/business
#POST /api/business
#GET /api/business/:id
#PUT /api/business/:id
#DELETE /api/business/:id
require 'rails_helper'

RSpec.describe "Clientes", type: :request do

  let!(:clientes) { create_list(:cliente, 2) }
  let(:cliente_id) { clientes.first.id }


  describe "GET /clientes" do
    include Rails.application.routes.url_helpers
    before { get '/clientes' }

    it 'returns clientes' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)            
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

  end
end

require 'rails_helper'

RSpec.describe 'Services', type: :request do
  before(:all) do
    @empty_json_services_array = "{\"services\":\"[]\"}"
  end

  before(:each) do
    Service.all.map(&:destroy)
  end

  describe 'GET /services' do
    # Implementing only JSON right now
    # because we can provide XML later or never :-)
    it 'returns an error if XML is requested' do
      get api_v2_services_path, format: :xml
      expect(response).to have_http_status(501)
    end

    it 'returns an empty JSON array if no Services' do
      get api_v2_services_path, format: :json
      expect(response).to have_http_status(200)
      expect(response.body).to eql(@empty_json_services_array)
    end

    it 'returns an array (JSON) with Service attributes' do
      dummy = Fabricate(:service)
      get api_v2_services_path, format: :json
      services = JSON.parse(response.body)['services']
      service = JSON.parse(services).first
      expect(response.body).not_to eql(@empty_json_services_array)
      expect(service['id']).to eql(dummy.id)
    end
  end

  describe 'GET /service/:id' do
    it 'returns a single Service description' do
      dummy = Fabricate(:service)
      get api_v2_service_path(id: dummy.id), format: :json
      expect(JSON.parse(response.body)['id']).to eql(dummy.id)
      expect(JSON.parse(response.body)['description']).to eql(dummy.description)
    end
  end
end

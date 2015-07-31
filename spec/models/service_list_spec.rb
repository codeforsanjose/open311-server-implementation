require 'rails_helper'

RSpec.describe ServiceList, type: :model do
  before(:all) do
    Service.all.map(&:destroy)
    @empty_json_services_array = '{"services":"[]"}'
    Struct.new('Response', :body, :status)
    @response = Struct::Response.new
  end

  it 'returns a not-implemented status unless request is JSON' do
    service_list = ServiceList.new.deliver(:xml, @response)
    expect(service_list.status).to eql(:not_implemented)
  end

  it 'returns an empty array if there are no Service instances' do
    service_list = ServiceList.new.deliver(:json, @response)
    expect(service_list.body).to eql(@empty_json_services_array)
  end

end

require 'rails_helper'

RSpec.describe StatusHelper, type: :helper do
  describe 'properties' do
    let(:properties_response) { StatusHelper::EasyBrokerChecker.new.properties }
    it "returns correctly some properties", :vcr do
      expect(properties_response).to be_kind_of(RestClient::Response)
      expect(JSON.parse(properties_response)).to have_key('content')
      expect(JSON.parse(properties_response)).to have_key('pagination')
      expect(JSON.parse(properties_response)['content'].first).to have_key('title')
    end
  end

  describe 'status?' do
    let(:status_response) { StatusHelper::EasyBrokerChecker.status? }
    it "returns Ok API status", :vcr do
      expect(status_response).to be_eql("OK")
    end

    let(:status_response) { StatusHelper::EasyBrokerChecker.status? }
    it "returns Broken API status", :vcr do
      expect(status_response).to be_eql("Broken")
    end
  end

end

require 'rails_helper'

RSpec.describe EasyBrokerApi, type: :model do
  context 'on object create', :vcr do
    let(:response) {EasyBrokerApi.get_properties}
    it { expect(response).to be_truthy }
  end

  context 'on contact create', :vcr do
    let(:response) {EasyBrokerApi.post_contact({
      name: "John Smith",
      phone: "5559090909",
      email: "mail@example.com",
      property_id: "EB-B5515",
      message: "I'm interested in this property. Please contact me.",
      source: "mydomain.com"
    })}
    it { expect(response).to be_truthy }
  end
end

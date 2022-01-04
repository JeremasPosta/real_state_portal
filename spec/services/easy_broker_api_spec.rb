require 'rails_helper'

RSpec.describe EasyBrokerApi, type: :model do
  context 'on object create', :vcr do
    let(:response) {EasyBrokerApi.get_properties.execute}
    it { should be_truthy }
  end
end

# frozen_string_literal: true

class EasyBrokerApi
  MAX_ITEMS = 15
  API_URL = 'https://api.stagingeb.com/v1'

  def self.get_properties(extra_querys = {})
    query = build_query(extra_querys)
    RestClient::Request.new method: :get, url: properties_endpoint(query), headers: headers
  end

  def self.get_property(public_id)
    RestClient::Request.new method: :get, url: property_endpoint(public_id), headers: headers
  end

  def self.post_contact(contact_fields)
    contact_fields = contact_fields.to_json
    request = RestClient::Request.new(method: :post,
      url: contact_req_endpoint,
      payload: "#{contact_fields}",
      headers: {"Content-Type" => "application/json", "X-Authorization" => "#{ENV['EB_API_KEY']}"}
     )
  end

  def self.build_query(query)
    { limit: MAX_ITEMS, page: 1, 'search[statuses][]' => 'published' }.merge(query).to_query
  end

  def self.properties_endpoint(query)
    "https://api.stagingeb.com/v1/properties?#{query}"
  end

  def self.property_endpoint(public_id)
    "https://api.stagingeb.com/v1/properties/#{public_id}"
  end

  def self.contact_req_endpoint
    "#{API_URL}/contact_requests"
  end

  def self.headers
    { 'X-Authorization' => ENV['EB_API_KEY'] }
  end
end

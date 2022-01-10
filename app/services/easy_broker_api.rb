# frozen_string_literal: true

class EasyBrokerApi
  MAX_ITEMS = 15
  API_URL = 'https://api.stagingeb.com/v1'

  def self.get_properties(extra_querys = {})
    query = build_query(extra_querys)
    RestClient.get properties_endpoint(query), headers
  end

  def self.get_property(public_id)
    RestClient.get property_endpoint(public_id), headers
  end

  def self.post_contact(contact_fields)
    RestClient.post contact_endpoint, contact_fields.to_json, {"Content-Type" => "application/json"}.merge(headers)
  end

  def self.build_query(query)
    { limit: MAX_ITEMS, page: 1, 'search[statuses][]' => 'published' }.merge(query).to_query
  end

  def self.properties_endpoint(query = '')
    "#{API_URL}/properties?#{query}"
  end

  def self.property_endpoint(public_id = '')
    "#{API_URL}/properties/#{public_id}"
  end

  def self.contact_endpoint
    "#{API_URL}/contact_requests"
  end

  def self.headers
    { 'X-Authorization' => ENV['EB_API_KEY'] }
  end
end

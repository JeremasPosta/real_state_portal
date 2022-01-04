# frozen_string_literal: true

class EasyBrokerApi
  MAX_ITEMS = 15

  def self.get_properties(extra_querys = {})
    query = build_query(extra_querys)
    RestClient::Request.new method: :get, url: properties_endpoint(query), headers: headers
  end

  def self.build_query(query)
    { limit: MAX_ITEMS, page: 1, 'search[statuses][]' => 'published' }.merge(query).to_query
  end

  def self.properties_endpoint(query)
    "https://api.stagingeb.com/v1/properties?#{query}"
  end

  def self.headers
    { 'X-Authorization' => ENV['EB_API_KEY'] }
  end
end

module StatusHelper
  class EasyBrokerChecker
    def properties
      begin
        response =
        RestClient::Request.new(
          method: :get,
          url: "https://api.stagingeb.com/v1/properties",
          headers: {
            "X-Authorization" => ENV['EB_API_KEY']
          }).execute
        rescue => except
          puts "#{except.class}: #{except.message}"
      end
      response
    end

    def self.status?
      properties_response = EasyBrokerChecker.new.properties
      return "Broken" if properties_response.nil?
      Rack::Utils::HTTP_STATUS_CODES[properties_response.code]
    end

  end
end

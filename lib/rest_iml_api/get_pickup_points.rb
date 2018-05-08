module RestImlApi
  class GetPickupPointsList
    URL = 'http://list.iml.ru/sd'.freeze
    class << self
      def call
        uri = URI(URL)
        req = Net::HTTP::Get.new(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        res = http.request(req)
        res.is_a?(Net::HTTPOK) ? JSON.parse(res.body) : res
      end
    end
  end
end

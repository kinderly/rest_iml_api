module RestImlApi
  class Request
    require 'openssl'
    require 'net/http'
    require 'json'

    URL = 'https://api.iml.ru/Json/'
    ACTIONS ={
      get_statuses: 'GetStatuses',
      get_orders: 'GetOrders',
      create_order: 'CreateOrder'
    }

    class << self
      def request(query, action)
        uri = URI(URL + ACTIONS[action])
        req = Net::HTTP::Post.new(uri)
        req.set_form_data(query)
        req.basic_auth(ENV['IML_LOGIN'], ENV['IML_PASSWORD'])
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = if @verify_certificate
                             OpenSSL::SSL::VERIFY_PEER
                           else
                             OpenSSL::SSL::VERIFY_NONE
                           end
        res = http.request(req)
        if res.is_a? Net::HTTPOK
          JSON.parse(res.body)
        else
          res
        end
      end
    end
  end
end

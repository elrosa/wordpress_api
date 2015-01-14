require 'faraday'
require 'faraday_middleware'

module WordpressApi
  module Helpers
    module Connection

      def connection(options={})
        default_options = {
            headers: { authorization: "Bearer #{credentials[:token]}"},
            url: "https://public-api.wordpress.com/rest/v1.1"
        }
        Faraday.new(default_options)
      end

    end
  end
end
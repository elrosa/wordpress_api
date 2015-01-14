require 'faraday'
require 'faraday_middleware'

module WordpressApi
  module Helpers
    module Connection

      def connection(options={})
        options = options.clone

        default_options = {
            headers: {
                accept: 'application/json',
                user_agent: "wordpress_api gem",
                authorization: "Bearer #{credentials[:token]}"
            },
            url: "https://public-api.wordpress.com/rest/v1"
        }

        Faraday.new(default_options.merge(options)) do |conn|
          conn.request :multipart
          conn.request :url_encoded

          conn.response :json, content_type: /\bjson$/
          conn.use :instrumentation
          conn.adapter Faraday.default_adapter
        end
      end

    end
  end
end
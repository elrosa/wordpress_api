module Wordpress
  module Helpers

    module Authorization
      def consumer
        @consumer ||= ::OAuth::Consumer.new(@consumer_token, @consumer_secret, {:site => "https://public-api.wordpress.com"})
      end

      def access_token
        @access_token ||= ::OAuth::AccessToken.new(consumer, @auth_token, @auth_secret)
      end

      def authorize_from_access(token, secret)
        @auth_token, @auth_secret = token, secret
      end
    end
  end
end

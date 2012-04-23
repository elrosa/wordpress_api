module Wordpress

  class TestClient
    include Helpers::Authorization
    include Helpers::Requests
    include Api::Reader
    include Api::Writer

    attr_reader :consumer_token, :consumer_secret, :consumer_options

    def initialize(token= Wordpress.token, secret=Wordpress.secret, options={})
      @consumer_token   = token
      @consumer_secret  = secret
      @consumer_options = options
    end

  end

end

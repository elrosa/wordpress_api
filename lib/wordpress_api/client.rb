require 'cgi'

module WordpressApi

  class Client
    include Helpers::Request
    include Helpers::Authorization
    include Api::Reader
    include Api::Writer

    attr_reader :consumer_token, :consumer_secret, :consumer_options

    def initialize(ctoken=Wordpress.token, csecret=Wordpress.secret, options={})
      @consumer_token   = ctoken
      @consumer_secret  = csecret
      @consumer_options = options
    end


  end

end

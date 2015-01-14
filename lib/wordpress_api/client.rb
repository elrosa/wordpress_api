require 'cgi'

module WordpressApi

  class Client
    include Helpers::Request
    include Helpers::Authorization
    include Api::Reader
    include Api::Writer

    attr_accessor :access_token, :client_id, :client_secret


    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end

    # @return [Hash]
    def credentials
      {
          client_id: client_id,
          client_secret: client_secret,
          token: access_token
      }
    end

    # @return [Boolean]
    def credentials?
      credentials.values.all?
    end


  end

end

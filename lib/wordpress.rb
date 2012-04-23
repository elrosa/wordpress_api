require 'oauth'

module Wordpress

  class << self
    attr_accessor :token, :secret
    def configure
      yield self
      true
    end
  end

  autoload :Api,     "wordpress/api"
  autoload :TestClient,  "wordpress/client"
  autoload :Mash,    "wordpress/mash"
  autoload :Errors,  "wordpress/errors"
  autoload :Helpers, "wordpress/helpers"
end

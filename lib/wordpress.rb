require 'omniauth-oauth2'

module Wordpress

  class << self
    attr_accessor :token, :secret

    # config/initializers/wordpress.rb (for instance)
    #
    # Wordpress.configure do |config|
    #   config.token = 'consumer_token'
    #   config.secret = 'consumer_secret'
    #   config.default_profile_fields = ['education', 'positions']
    # end
    #
    # elsewhere
    #
    # client = Wordpress::Client.new
    def configure
      yield self
      true
    end
  end

  autoload :Api,     "wordpress/api"
  autoload :Client,  "wordpress/client"
  autoload :Mash,    "wordpress/mash"
  autoload :Errors,  "wordpress/errors"
  autoload :Helpers, "wordpress/helpers"
  autoload :Version, "wordpress/version"
end

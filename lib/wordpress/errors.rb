module Wordpress
  module Errors
    class WordpressError < StandardError
      attr_reader :data
      def initialize(data)
        @data = data
        super
      end
    end

    class UnauthorizedError   < WordpressError; end
    class GeneralError        < WordpressError; end

    class UnavailableError    < WordpressError; end
    class ServerError         < WordpressError; end
    class NotFoundError       < WordpressError; end
  end
end

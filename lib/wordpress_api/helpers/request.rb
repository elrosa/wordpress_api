module WordpressApi
  module Helpers

    module Request

      def get(path, params = {})
        response = connection.get do |req|
          req.url path
          req.params = params unless params.empty?
        end
        respond(response)
      end

      def post(path, params={})
        response = connection.post do |req|
          req.url path
          req.body = params unless params.empty?
        end
        respond(response)
      end

      def respond response
        raise_errors(response)
        response.body
      end

      def raise_errors(response)
        Rails.logger.fatal response
        data = WordpressApi::Mash.new(response.body)
        case response.status
        when 401
          raise WordpressApi::Errors::UnauthorizedError.new(data), "(#{data.status}): #{data.message}"
        when 400, 403
          raise WordpressApi::Errors::GeneralError.new(data), "(#{data.status}): #{data.message}"
        when 404
          raise WordpressApi::Errors::NotFoundError, "(#{response.code}): #{response.message}"
        when 500
          raise WordpressApi::Errors::ServerError, "(#{response.code}): #{response.message}"
        when 502..503
          raise WordpressApi::Errors::UnavailableError, "(#{response.code}): #{response.message}"
        end
      end

    end

  end
end

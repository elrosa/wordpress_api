module Wordpress
  module Helpers

    module Requests

      API_PATH = '/rest/v1'

      protected

        def get(path, options={})
          response = access_token.get("#{API_PATH}#{path}", options)
          raise_errors(response)
          response.body
        end

        def post(path, body='', options={})
          response = access_token.post("#{API_PATH}#{path}", body, options)
          raise_errors(response)
          response
        end

        def put(path, body, options={})
          response = access_token.put("#{API_PATH}#{path}", body, options)
          raise_errors(response)
          response
        end

        def delete(path, options={})
          response = access_token.delete("#{API_PATH}#{path}", options)
          raise_errors(response)
          response
        end

      private

        def raise_errors(response)
          # Even if the json answer contains the HTTP status code, LinkedIn also sets this code
          # in the HTTP answer (thankfully).
          case response.code.to_i
          when 401
            data = Mash.from_json(response.body)
            raise Wordpress::Errors::UnauthorizedError.new(data), "(#{data.status}): #{data.message}"
          when 400, 403
            data = Mash.from_json(response.body)
            raise Wordpress::Errors::GeneralError.new(data), "(#{data.status}): #{data.message}"
          when 404
            raise Wordpress::Errors::NotFoundError, "(#{response.code}): #{response.message}"
          when 500
            raise Wordpress::Errors::ServerError, "(#{response.code}): #{response.message}"
          when 502..503
            raise Wordpress::Errors::UnavailableError, "(#{response.code}): #{response.message}"
          end
        end

        def to_query(options)
          options.inject([]) do |collection, opt|
            collection << "#{opt[0]}=#{opt[1]}"
            collection
          end * '&'
        end

        def to_uri(path, options)
          uri = URI.parse(path)

          if options && options != {}
            uri.query = to_query(options)
          end
          uri.to_s
        end
    end

  end
end

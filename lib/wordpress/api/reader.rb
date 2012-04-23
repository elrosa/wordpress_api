module Wordpress
  module Api
    module Reader

      def profile(options={})
        query("/me", options)
      end

      private
        def query path, options
          headers = options[:headers] || {}
          params_str = ""
          params = options[:params] || {}
          params.each { |key, value| params_str << "#{key}=#{value}&"}
          path += ("?" + params_str.chop) unless (params_str == "")
          Mash.from_json(get(path, headers))
        end
    end
  end

end
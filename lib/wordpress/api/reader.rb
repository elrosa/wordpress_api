module Wordpress
  module Api

    module Reader

      def profile(options={})
        path = "/me"
        simple_query(path, options)
      end
      private

        def simple_query(path, options={})

          if options[:public]
            path +=":public"
          elsif fields
            path +=":(#{fields.map{ |f| f.to_s.gsub("_","-") }.join(',')})"
          end
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
module Wordpress
  module Api

    module Writer

      def create_post blog_id, content, options={}
        path = "/sites/#{blog_id}/posts/new"
        params_str = ""
        content.each { |key, value| params_str << "#{key}=#{value}&"}
        path += ("?" + params_str.chop) unless (params_str == "")
        Mash.from_json(post(path, options))
      end
    end

  end
end

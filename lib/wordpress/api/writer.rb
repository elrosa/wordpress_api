module Wordpress
  module Api

    module Writer

      def create_post blog_id, content, options={}
        path = "/sites/#{blog_id}/posts/new"

        Mash.from_json(post(path, options.merge({:body => content.to_json})))
      end
    end

  end
end

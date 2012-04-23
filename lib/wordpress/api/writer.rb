module Wordpress
  module Api

    module Writer

      def create_post blog_id, content, options={}
        path = "/sites/#{blog_id}/posts/new"
        Mash.from_json(post(path, content.to_json, options))
      end

      def delete_post blog_id, post_id, options={}
        path = "/sites/#{blog_id}/posts/#{post_id}/delete"
        Mash.from_json(post(path, {}, options))
      end

      def repost blog_id, post_id, content, options={}
        path = "/sites/#{blog_id}/posts/#{post_id}/reblogs/new"
        Mash.from_json(post path, content.to_json, options)
      end

      def create_comment blog_id, post_id, content, options={}
        path = "/sites/#{blog_id}/posts/#{post_id}/replies/new"
        Mash.from_json(post path, content.to_json, options)
      end

      def create_comment_tree blog_id, comment_id, content, options={}
        path = "/sites/#{blog_id}/comments/#{comment_id}/replies/new"
        Mash.from_json(post path, content.to_json, options)
      end

      def delete_comment blog_id, comment_id, options={}
        path = "/sites/#{blog_id}/comments/#{comment_id}/delete"
        Mash.from_json(post path, "", options)
      end

      def follow blog_id, options={}
        path = "/sites/#{blog_id}/follows/new"
        Mash.from_json(post(path, "", options))
      end

      def unfollow blog_id, options={}
        path = "/sites/#{blog_id}/follows/mine/delete"
        Mash.from_json(post(path, "", options))
      end
    end

  end
end

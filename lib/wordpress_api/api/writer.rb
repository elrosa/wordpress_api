module WordpressApi
  module Api

    module Writer

      def create_post blog_id, params={}
        path = "sites/#{blog_id}/posts/new"
        Mash.new(post(path, params))
      end

      def delete_post blog_id, post_id, params={}
        path = "sites/#{blog_id}/posts/#{post_id}/delete"
        Mash.new(post(path,  params))
      end

      def repost blog_id, post_id, params={}
        path = "sites/#{blog_id}/posts/#{post_id}/reblogs/new"
        Mash.new(post path, params)
      end

      def create_comment blog_id, post_id, params={}
        path = "sites/#{blog_id}/posts/#{post_id}/replies/new"
        Mash.new(post path, params)
      end

      def create_comment_tree blog_id, comment_id, params={}
        path = "sites/#{blog_id}/comments/#{comment_id}/replies/new"
        Mash.new(post path, params)
      end

      def delete_comment blog_id, comment_id, params={}
        path = "sites/#{blog_id}/comments/#{comment_id}/delete"
        Mash.new(post path, params)
      end

      def create_like blog_id, post_id, params={}
        path = "sites/#{blog_id}/posts/#{post_id}/likes/new"
        Mash.new(post path, params)
      end

      def delete_like blog_id, post_id, params={}
        path = "sites/#{blog_id}/posts/#{post_id}/likes/mine/delete"
        Mash.new(post path, params)
      end

      def follow blog_id, params={}
        path = "sites/#{blog_id}/follows/new"
        Mash.new(post(path, params))
      end

      def unfollow blog_id, params={}
        path = "sites/#{blog_id}/follows/mine/delete"
        Mash.new(post(path, params))
      end
    end

  end
end

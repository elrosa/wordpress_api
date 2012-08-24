module WordpressApi
  module Api

    module Reader

      def profile(options={})
        path = "/me"
        Mash.from_json(get path, options)
      end

      def blog(blog_id, options={})
        path = "/sites/#{blog_id}"
        Mash.from_json(get path, options)
      end

      def posts(blog_id, options={})
        path = "/sites/#{blog_id}/posts"
        Mash.from_json(get path, options)
      end

      def likes(blog_id, post_id, options={})
        path = "/sites/#{blog_id}/posts/#{post_id}/likes"
        Mash.from_json(get path, options)
      end

      def comments(blog_id, post_id, options={})
        path = "/sites/#{blog_id}/posts/#{post_id}/replies"
        Mash.from_json(get path, options)
      end

      def followers(blog_id, options={})
        path = "/sites/#{blog_id}/follows/mine"
        Mash.from_json(get path, options)
      end


    end

  end
end
module WordpressApi
  module Api

    module Reader

      def profile(options={})
        path = "/me"
        response = get path, options
        pp response

        WordpressApi::Mash.new(response)
      end

      def blog(blog_id, options={})
        path = "/sites/#{blog_id}"
        Mash.new(get path, options)
      end

      def posts(blog_id, options={})
        path = "/sites/#{blog_id}/posts"
        Mash.new(get path, options)
      end

      def likes(blog_id, post_id, options={})
        path = "/sites/#{blog_id}/posts/#{post_id}/likes"
        Mash.new(get path, options)
      end

      def comments(blog_id, post_id, options={})
        path = "/sites/#{blog_id}/posts/#{post_id}/replies"
        Mash.new(get path, options)
      end

      def followers(blog_id, options={})
        path = "/sites/#{blog_id}/follows/mine"
        Mash.new(get path, options)
      end


    end

  end
end
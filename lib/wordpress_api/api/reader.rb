module WordpressApi
  module Api

    module Reader

      def profile(params={})
        WordpressApi::Mash.new(get "me", params)
      end

      def blog(blog_id, params={})
        path = "sites/#{blog_id}"
        Mash.new(get path, params)
      end

      def posts(blog_id, params={})
        path = "sites/#{blog_id}/posts"
        Mash.new(get path, params)
      end

      def likes(blog_id, post_id, params={})
        path = "sites/#{blog_id}/posts/#{post_id}/likes"
        Mash.new(get path, params)
      end

      def comments(blog_id, post_id, params={})
        path = "sites/#{blog_id}/posts/#{post_id}/replies"
        Mash.new(get path, params)
      end

      def followers(blog_id, params={})
        path = "sites/#{blog_id}/follows/mine"
        Mash.new(get path, params)
      end


    end

  end
end
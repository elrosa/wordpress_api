module Wordpress
  module Api

    module Reader

      def profile(options={})
        path = "/me"
        Mash.from_json(get path)
      end


    end

  end
end
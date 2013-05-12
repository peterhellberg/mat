# encoding: utf-8

require_relative '../mat'

require 'json'

module Mat
  class CLI
    class << self
      def get_data(query)
        if query.to_s.match(/^\d+$/)
          Mat.api.foodstuff(query)
        else
          Mat.api.foodstuffs(query)
        end
      end

      def search(query)
        puts JSON.pretty_generate get_data(query)
      rescue Mat::HTTP::Exception
        warn "Nothing found"
      end
    end
  end
end


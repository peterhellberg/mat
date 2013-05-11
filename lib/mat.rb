# encoding: utf-8

require_relative "mat/api"
require_relative "mat/foodstuff"
require_relative "mat/http"
require_relative "mat/nutrient"
require_relative "mat/version"

module Mat
  class << self
    def api(config = nil)
      API.new(config).tap do |api|
        yield(api.config) if block_given?
      end
    end

    def all(query = nil)
      Foodstuff.all(query)
    end

    def find(number, nutrient = nil)
      if number.to_s.match(/^\d+$/)
        Foodstuff.find(number, nutrient)
      else
        Foodstuff.all(number).first
      end
    end

    def nutrient(slug)
      Nutrient.find(slug)
    end

    def nutrients
      Nutrient.all
    end
  end
end

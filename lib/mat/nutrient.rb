# encoding: utf-8

module Mat
  class Nutrient
    class << self
      def find(slug)
        new get_data(slug)
      end

      def all
        Mat.api.nutrients.map { |d| new(d) }
      end

      def get_data(slug)
        Mat.api.nutrient(slug)
      end
    end

    attr_reader :data

    def initialize(data)
      @data = data || {}
    end

    def slug
      @data['slug']
    end

    def name
      @data['name']
    end

    def unit
      @data['unit']
    end

    def get_data!
      initialize self.class.get_data(slug)
      self
    end
  end
end

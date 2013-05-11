# encoding: utf-8

module Mat
  class Foodstuff
    class << self
      def find(number, nutrient = nil)
        new get_data(number, nutrient)
      end

      def all(query)
        Mat.api.foodstuffs(query).map { |d| new(d) }
      end

      def get_data(number, nutrient = nil)
        Mat.api.foodstuff(number, nutrient)
      end
    end

    attr_reader :data

    def initialize(data)
      @data = data || {}
    end

    def name
      data['name']
    end

    def number
      data['number']
    end

    def nutrient_values
      get_data! if data['nutrientValues'].nil?

      data['nutrientValues']
    end

    def method_missing(m, *args, &block)
      if nutrient_values.respond_to?(:keys) &&
         nutrient_values.keys.include?(m.to_s)
        nutrient_values[m.to_s]
      else
        super
      end
    end

    def get_data!
      initialize self.class.get_data(number)
      self
    end
  end
end

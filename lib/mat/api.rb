# encoding: utf-8

require 'uri'

require_relative "api/config"

module Mat
  class API
    attr_accessor :config

    def initialize(config = nil)
      @config = config || API::Config.new

      yield(@config) if block_given?
    end

    def foodstuff(number, nutrient = nil)
      endpoint  = "foodstuff/#{number}"
      endpoint += "?nutrient=#{nutrient}" if nutrient

      get(endpoint)
    end

    def foodstuffs(query = nil)
      query.nil?? get("foodstuff") : get("foodstuff?query=#{URI::encode(query)}")
    end

    def nutrient(slug)
      get("nutrient/#{slug}")
    end

    def nutrients
      get("nutrient")
    end

    def get(path)
      response = http_get(path)
      load_json(response.body) if response && response.body
    end

    private

    def http_get(path)
      config.http_client.get(uri(path))
    end

    def uri(endpoint = nil)
      URI.parse("#{config.base_url}#{endpoint}")
    end

    def load_json(doc)
      config.json_parser.load(doc)
    end
  end
end

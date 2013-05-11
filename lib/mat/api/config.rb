# encoding: utf-8

require 'json'

module Mat
  class API
    class Config
      attr_accessor :base_url, :http_client, :json_parser

      def initialize
        @base_url    = 'http://matapi.se/'
        @http_client = Mat::HTTP
        @json_parser = JSON

        yield self if block_given?
      end
    end
  end
end


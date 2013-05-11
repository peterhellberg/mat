# encoding: utf-8

require 'net/http'

require_relative "version"

module Mat
  class HTTP
    HEADERS = {
      'User-Agent' => "RubyGem: mat (#{Mat::VERSION})"
    }

    class << self
      def get(uri)
        perform uri, Net::HTTP::Get.new(uri.request_uri, HEADERS)
      end

      private

      def perform(uri, request)
        Net::HTTP.start(uri.host, uri.port) do |http|
          http.read_timeout = 60
          response = http.request(request)
          http.finish

          if response.kind_of? Net::HTTPSuccess
            response
          else
            raise Exception, response
          end
        end
      end
    end

    class Exception < RuntimeError
      attr_accessor :response
      attr_reader   :message

      def initialize(response = nil)
        @response = response
        @message  = response.message if response
      end
    end
  end
end


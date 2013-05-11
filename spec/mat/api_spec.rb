# encoding: utf-8

require_relative '../spec_helper'

describe "API" do
  subject { Mat::API }

  let(:api)           { api_with_test_config(Mat::API.new) }
  let(:base_url)      { "http://api.test/" }
  let(:expected_uri)  { URI.parse "#{base_url}/endpoint" }

  describe "initialize" do
    it "takes a config" do
      subject.new("foo").config.must_equal "foo"
    end

    it "instantiates a default config" do
      subject.new.config.base_url.must_equal "http://matapi.se/"
    end
  end

  describe "get" do
    it "checks for nil responses" do
      api.stub(:http_get, nil) do
        api.get('nil').must_be_nil
      end
    end

    it "retrieves the data using a HTTP GET" do
      api.stub(:http_get, fake_response('{"foo":"bar"}')) do
        api.get('/').keys.first.must_equal "foo"
      end
    end
  end

  describe "foodstuff" do
    it "parses the returned body" do
      api.stub(:http_get, fixture_response('foodstuff/44')) do
        api.foodstuff(44)["name"].must_equal "Dressing majonnäs fett ca 40% "
      end
    end
  end
end

# encoding: utf-8

require_relative 'spec_helper'

describe Mat do
  subject { Mat }

  let(:api) { api_with_test_config(Mat::API.new) }

  describe "api" do
    it "returns a configured api client" do
      api.config.base_url.must_equal "api.test"
    end

    it "memoizes the api client" do
      subject.api.object_id.wont_equal subject.api.object_id
    end

    it "can configure the base_url" do
      api.config.base_url.must_equal 'api.test'

      configured_api = subject.api { |c| c.base_url = 'api.changed' }
      configured_api.config.base_url.must_equal 'api.changed'
    end
  end

  describe "all" do
    it "finds all foodstuffs" do
      Mat::Foodstuff.stub(:all, 'all foodstuffs') do
        Mat.all.must_equal 'all foodstuffs'
      end
    end
  end

  describe "find" do
    it "finds a foodstuff" do
      Mat::Foodstuff.stub(:find, 'foodstuff') do
        Mat.find(3).must_equal 'foodstuff'
      end
    end
  end

  describe "nutrient" do
    it "finds a nutrient" do
      Mat::Nutrient.stub(:find, 'nutrient') do
        Mat.nutrient(:salt).must_equal 'nutrient'
      end
    end
  end

  describe "nutrients" do
    it "returns all nutrients" do
      Mat::Nutrient.stub(:all, 'all nutrients') do
        Mat.nutrients.must_equal 'all nutrients'
      end
    end
  end
end

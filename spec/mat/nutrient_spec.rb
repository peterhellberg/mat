# encoding: utf-8

require_relative '../spec_helper'

describe Mat::Nutrient do
  subject { Mat::Nutrient }

  let(:fixture_data)  { parsed_fixture('nutrient') }
  let(:nutrients)     { fixture_data.map { |d| subject.new(d) } }
  let(:nutrient)      { nutrients[4] }

  describe "initialize" do
    it "takes data as input" do
      subject.new("foo").data.must_equal "foo"
    end
  end

  describe "slug" do
    it "returns the slug from the data" do
      nutrient.slug.must_equal "carbohydrates"
    end
  end

  describe "name" do
    it "returns the name from the data" do
      nutrient.name.must_equal "Carbohydrates"
    end
  end

  describe "unit" do
    it "returns the unit from the data" do
      nutrient.unit.must_equal "g"
    end
  end
end

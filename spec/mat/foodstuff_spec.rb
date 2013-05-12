# encoding: utf-8

require_relative '../spec_helper'

describe Mat::Foodstuff do
  subject { Mat::Foodstuff }

  let(:fixture_file)  { 'foodstuff/44' }
  let(:fixture_data)  { parsed_fixture(fixture_file) }
  let(:foodstuff)     { subject.new(fixture_data) }

  describe "initialize" do
    it "takes data as input" do
      subject.new("foo").data.must_equal "foo"
    end
  end

  describe "name" do
    it "returns the name from the data" do
      foodstuff.name.must_equal "Dressing majonnäs fett ca 40%"
    end
  end

  describe "number" do
    it "returns the number from the data" do
      foodstuff.number.must_equal 44
    end
  end

  describe "nutrient_values" do
    it "returns the nutrient values for the food" do
      foodstuff.nutrient_values['energyKj'].must_equal 1898
    end

    it "it retrieves more data if needed" do
      food = subject.new("number" => 44)

      Mat.api.stub(:foodstuff, fixture_data) do
        food.nutrient_values['energyKj'].must_equal 1898
      end
    end
  end

  describe "get_data!" do
    it "retrieves more data" do
      food = subject.new("number" => 44)

      Mat.api.stub(:foodstuff, fixture_data) do
        food.get_data!.zink.must_equal 0.1
      end
    end
  end
end

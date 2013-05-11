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
end

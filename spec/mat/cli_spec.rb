# encoding: utf-8

require_relative '../spec_helper'

describe Mat::CLI do
  subject { Mat::CLI }

  describe "get_data" do
    it "finds foodstuff by number" do
      Mat.api.stub(:foodstuff, "data") do
        subject.get_data(123).must_equal "data"
      end
    end

    it "queries foodstuffs by name" do
      Mat.api.stub(:foodstuffs, "search result") do
        subject.get_data('Mjölk').must_equal "search result"
      end
    end
  end

  describe "search" do
    it "pretty formats the returned JSON" do
      subject.stub(:get_data, ->(q) { { foo:'bar' } }) do
        ->{ subject.search('foo') }.must_output "{\n  \"foo\": \"bar\"\n}\n"
      end
    end

    it "prints a warning on exception" do
      subject.stub(:get_data, ->(q){ raise Mat::HTTP::Exception }) do
        ->{ subject.search('foo') }.must_output nil, "Nothing found\n"
      end
    end
  end
end

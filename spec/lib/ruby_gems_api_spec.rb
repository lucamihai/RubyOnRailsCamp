require "rspec"
require 'spec_helper'

require "./lib/ruby_gems_api.rb"
require "./lib/my_gem.rb"

RSpec.describe RubyGemsApi do
  describe ".gem_by_name" do
    it "performs the expected GET request" do
      http_service_mock = double('http_service', get: {'name': 'faraday', 'info': 'some info'} )

      ruby_gems_api = RubyGemsApi.new(http_service_mock)

      expectedUri = "https://rubygems.org/api/v1/gems/faraday"
      expect(http_service_mock).to receive(:get).with(expectedUri)
      ruby_gems_api.gem_by_name("faraday")
    end

    it "returns expected entity" do
      http_service_mock = double('http_service', get: {'name' => 'faraday', 'info' => 'some info'} )

      ruby_gems_api = RubyGemsApi.new(http_service_mock)

      entity = ruby_gems_api.gem_by_name("faraday")
      expect(entity.name).to eq "faraday"
      expect(entity.info).to eq "some info"
    end
  end

  describe ".search_gems" do
    context "with no limit provided" do
      it "performs the expected GET request" do
        http_service_mock = double('http_service', get: [{'name' => 'faraday', 'info' => 'some info'}, {'name' => 'faraday2', 'info' => 'some info'}] )

        ruby_gems_api = RubyGemsApi.new(http_service_mock)

        expectedUri = "https://rubygems.org/api/v1/search?query=faraday"
        expect(http_service_mock).to receive(:get).with(expectedUri)
        ruby_gems_api.search_gems("faraday", 0)
      end

      it "returns expected list" do
        http_service_mock = double('http_service', get: [{'name' => 'faraday', 'info' => 'some info'}, {'name' => 'faraday2', 'info' => 'some info2'}] )
  
        ruby_gems_api = RubyGemsApi.new(http_service_mock)
  
        list = ruby_gems_api.search_gems("faraday", 0)
        expect(list.count).to eq 2
        expect(list[0].name).to eq "faraday"
        expect(list[0].info).to eq "some info"
        expect(list[1].name).to eq "faraday2"
        expect(list[1].info).to eq "some info2"
      end
    end

    context "with limit provided" do
      it "performs the expected GET request" do
        http_service_mock = double('http_service', get: [{'name' => 'faraday', 'info' => 'some info'}, {'name' => 'faraday2', 'info' => 'some info'}] )

        ruby_gems_api = RubyGemsApi.new(http_service_mock)

        expectedUri = "https://rubygems.org/api/v1/search?query=faraday"
        expect(http_service_mock).to receive(:get).with(expectedUri)
        ruby_gems_api.search_gems("faraday", 1)
      end

      it "returns expected list" do
        http_service_mock = double('http_service', get: [{'name' => 'faraday', 'info' => 'some info'}, {'name' => 'faraday2', 'info' => 'some info2'}] )
  
        ruby_gems_api = RubyGemsApi.new(http_service_mock)
  
        list = ruby_gems_api.search_gems("faraday", 1)
        expect(list.count).to eq 1
        expect(list[0].name).to eq "faraday"
        expect(list[0].info).to eq "some info"
      end
    end
  end
end
require "rspec"
require "./lib/arguments_parser.rb"

RSpec.describe ArgumentsParser do
  describe ".parse" do
    context "Given show command" do
      it "returns expected entity" do
        expect(ArgumentsParser.parse(["show", "faraday"]).name).to eq "faraday"
        expect(ArgumentsParser.parse(["show", "faraday"]).search_term).to eq ""
        expect(ArgumentsParser.parse(["show", "faraday"]).search_limit).to eq 0
      end
    end

    context "Given search command" do
      it "returns expected entity" do
        expect(ArgumentsParser.parse(["search", "faraday"]).name).to eq ""
        expect(ArgumentsParser.parse(["search", "faraday"]).search_term).to eq "faraday"
        expect(ArgumentsParser.parse(["search", "faraday"]).search_limit).to eq 0
      end
    end

    context "Given search command with limit" do
      it "returns expected entity" do
        expect(ArgumentsParser.parse(["search", "faraday", "--limit", "3"]).name).to eq ""
        expect(ArgumentsParser.parse(["search", "faraday", "--limit", "3"]).search_term).to eq "faraday"
        expect(ArgumentsParser.parse(["search", "faraday", "--limit", "3"]).search_limit).to eq 3
      end
    end
  end
end
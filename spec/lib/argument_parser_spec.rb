require "rspec"
require "./lib/arguments_parser.rb"

RSpec.describe ArgumentsParser do
  describe ".parse" do
    context "Given show command" do
      subject { ArgumentsParser.parse(["show", "faraday"]) }
      it "returns expected entity" do
        expect(subject.name).to eq "faraday"
        expect(subject.search_term).to eq ""
        expect(subject.search_limit).to eq 0
      end
    end

    context "Given search command" do
      subject { ArgumentsParser.parse(["search", "faraday"]) }
      it "returns expected entity" do
        expect(subject.name).to eq ""
        expect(subject.search_term).to eq "faraday"
        expect(subject.search_limit).to eq 0
      end
    end

    context "Given search command with limit" do
      subject { ArgumentsParser.parse(["search", "faraday", "--limit", "3"]) }
      it "returns expected entity" do
        expect(subject.name).to eq ""
        expect(subject.search_term).to eq "faraday"
        expect(subject.search_limit).to eq 3
      end
    end
  end
end
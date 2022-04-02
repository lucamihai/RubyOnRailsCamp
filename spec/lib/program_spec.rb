require "rspec"
require "./lib/program.rb"
require "./lib/my_gem.rb"

RSpec.describe Program do
  describe ".execute" do
    # TODO: I have no idea how to make mocks, so I'll let this test fail as a sign of shame for myself
    context "Given show command" do
      it "calls RubyGemsApi.gem_by_name method with the correct argument" do
        ruby_gems_api_mock = double
        ruby_gems_api_mock.stub(:gem_by_name).and_return(MyGem.new("faraday", "some info"))

        program = Program.new(ruby_gems_api_mock)

        expect(ruby_gems_api_mock).to receive(:gem_by_name).with("faraday")
        program.execute(["show", "faraday"])
      end
    end

    context "Given search command" do
      it "calls RubyGemsApi.search_gems method with the correct arguments" do
        ruby_gems_api_mock = double
        ruby_gems_api_mock.stub(:search_gems).and_return( [MyGem.new("faraday", "some info")] )

        program = Program.new(ruby_gems_api_mock)

        expect(ruby_gems_api_mock).to receive(:search_gems).with("faraday", 0)
        program.execute(["search", "faraday"])
      end
    end

    context "Given search command with limit" do
      it "calls RubyGemsApi.search_gems method with the correct arguments" do
        ruby_gems_api_mock = double
        ruby_gems_api_mock.stub(:search_gems).and_return( [MyGem.new("faraday", "some info")] )

        program = Program.new(ruby_gems_api_mock)

        expect(ruby_gems_api_mock).to receive(:search_gems).with("faraday", 3)
        program.execute(["search", "faraday", "--limit", 3])
      end
    end
  end
end
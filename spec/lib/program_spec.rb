require "rspec"
require "./lib/program.rb"

RSpec.describe Program do
  describe ".execute" do
    # TODO: I have no idea how to make mocks, so I'll let this test fail as a sign of shame for myself
    context "Given show command" do
      before do
        ARGV[0] = "show"
        ARGV[1] = "faraday"
      end
      it "calls RubyGemsApi.gem_by_name method with the correct argument" do
        expect(subject).to receive(:gem_by_name).with("faraday")
        subject.execute
      end
    end
  end
end
require 'coderetreats/presenters/collection'
require 'coderetreats'

describe CoderetreatApp::Coderetreats do
  describe ".running_today" do
=begin
    #uses mock objects
    it "returns the collection wrapped in the presenter" do
      presenter = double
      allow(CoderetreatApp::Coderetreats::Presenters::Collection).to receive(:for) { presenter }
      expect(CoderetreatApp::Coderetreats.running_today).to be(presenter)
    end
=end
    #uses real objects
    it "wraps the coderetreats running today in a presenter" do
      running_today = double "coderetreats"
      stub_const("::Coderetreat", double(running_today: running_today))
      presenter = double
      allow(CoderetreatApp::Coderetreats::Presenters::Collection). to receive(:for).with(running_today) { presenter }
      expect(CoderetreatApp::Coderetreats.running_today).to be(presenter)
    end
  end
end
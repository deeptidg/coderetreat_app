require 'coderetreats/presenters/collection'
require 'coderetreats'

describe CoderetreatApp::Coderetreats do
  describe ".running_today" do
    it "returns the collection wrapped in the presenter" do
      presenter = double
      allow(CoderetreatApp::Coderetreats::Presenters::Collection).to receive(:for) { presenter }
      expect(CoderetreatApp::Coderetreats.running_today).to be(presenter)
    end
  end
end
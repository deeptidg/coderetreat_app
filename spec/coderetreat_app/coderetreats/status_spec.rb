require 'coderetreats/status'

describe CoderetreatApp::Coderetreats::Status do
  describe ".update_to" do
    it "tells the coderetreat to update its status" do
      coderetreat = double
      stub_const("::Coderetreat", double(find: coderetreat))
      expect(coderetreat).to receive(:update_status).with("in_session")
      CoderetreatApp::Coderetreats::Status.update_to("5", "in_session")
    end
  end
end
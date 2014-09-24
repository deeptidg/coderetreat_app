require 'rails_helper'

describe StatusController do
  describe "GET /edit_status" do
    it "assigns the coderetreat" do
      coderetreat = double
      allow(::Coderetreat).to receive(:find).with("5") {coderetreat}
      get :edit, coderetreat_id: "5"
      expect(assigns(:coderetreat)).to be(coderetreat)
    end
  end

  describe "PUT /update" do
    let(:status_updater){ double(:update_to => nil) }
    before do
      allow(CoderetreatApp::Coderetreats::Status).to receive(:update_to)
      allow(status_updater).to receive(:update_to).with("5", "in_session")
    end

    it "redirects back to the edit status page" do
      put :update, coderetreat_id: "5", new_status: "in_session"
      expect(response).to redirect_to(edit_coderetreat_status_url("5"))
    end

    it "updates the status of the coderetreat" do
      expect(CoderetreatApp::Coderetreats::Status).to receive(:update_to).with("5", "in_session")
      put :update, coderetreat_id: "5", new_status: "in_session"
    end
  end

end
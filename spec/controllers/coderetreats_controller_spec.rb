require 'coderetreats/presenters/collection'

require 'rails_helper'
describe CoderetreatsController do
  describe "GET /running_today" do
    #it "uses a coderetreat collection presenter" do
     # coderetreats_presenter = double
      #line 9 is an alternative to line 10
      #stub_const("CoderetreatApp::Coderetreats::Presenters::Collection", double(for: coderetreats_presenter))
      #allow(CoderetreatApp::Coderetreats::Presenters::Collection).to receive(:for) { coderetreats_presenter }
      #get :running_today
      #expect(assigns(:coderetreats)).to be(coderetreats_presenter)
    #end

    it "gets the coderetreats running today" do
      coderetreats_presenter = double
      
      allow(CoderetreatApp::Coderetreats).to receive(:running_today) { coderetreats_presenter }
      get :running_today
      expect(assigns(:coderetreats)).to be(coderetreats_presenter)
    end
  end

  describe "GET /edit_status" do
    it "assigns the coderetreat" do
      coderetreat = double
      allow(::Coderetreat).to receive(:find).with("5") {coderetreat}
      get :edit_status, id: "5"
      expect(assigns(:coderetreat)).to be(coderetreat)
    end
  end

  describe "PUT /update_status" do
    let(:status_updater){ double(:update_to => nil) }
    before do
      stub_const("CoderetreatApp::Coderetreats::Status", status_updater)
      allow(status_updater).to receive(:update_to).with("5", "in_session")
    end

    it "redirects back to the edit status page" do
     put :update_status, id: "5", new_status: "in_session"
     expect(response).to redirect_to(edit_status_coderetreat_url("5"))
    end

    it "updates the status of the coderetreat" do
      allow(status_updater).to receive(:update_to).with("5", "in_session")
      put :update_status, id: "5", new_status: "in_session"
    end
  end
end
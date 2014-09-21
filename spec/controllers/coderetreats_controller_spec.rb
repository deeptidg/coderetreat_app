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
end
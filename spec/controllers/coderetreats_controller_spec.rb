require 'coderetreats/presenters/collection'

require 'rails_helper'
describe CoderetreatsController do
  describe "GET /running_today" do
    #it "uses a coderetreat collection presenter" do
      #coderetreats_presenter = double
      #line 9 is an alternative to line 10
      #stub_const("CoderetreatApp::Coderetreats::Presenters::Collection", double(for: coderetreats_presenter))
      #expect(CoderetreatApp::Coderetreats::Presenters::Collection).to receive(:for) { coderetreats_presenter }
      #get :running_today
      #expect(assigns(:coderetreats)).to be(coderetreats_presenter)
    #end
    it "gets the coderetreats running today" do
      coderetreats_presenter = double
      #stub_const("CoderetreatApp::Coderetreats::Presenters::Collection", double(for: coderetreats_presenter))
      CoderetreatApp::Coderetreats.stub(:running_today) { coderetreats_presenter }
      get :running_today
      expect(assigns(:coderetreats)).to be(coderetreats_presenter)
    end
  end

end
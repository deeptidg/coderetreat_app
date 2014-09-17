require 'rails_helper'

describe CoderetreatsController do
  describe "GET /running_today" do
    it "uses a coderetreat collection presenter" do
      coderetreats_presenter = double
      stub_const("CoderetreatApp::Coderetreats::Presenters::Collection", double(for: coderetreats_presenter))
      get :running_today
      expect(assigns(:coderetreats)).to be(coderetreats_presenter)
    end
  end
end
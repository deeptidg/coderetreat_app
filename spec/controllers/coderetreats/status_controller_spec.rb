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
end
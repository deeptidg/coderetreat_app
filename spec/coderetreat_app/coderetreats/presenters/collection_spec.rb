require 'coderetreats/presenters/collection'

describe CoderetreatApp::Coderetreats::Presenters::Collection do
  context "getting the coderetreats grouped by status" do
    let(:not_started) {double('not_started', status: "not_started")}
    let(:on_break) {double('on_break', status: "on_break")}
    let(:in_session) {double('in_session', status: "in_session")}
    let(:coderetreats) {[not_started, in_session, on_break]}
    let(:presenter) {CoderetreatApp::Coderetreats::Presenters::Collection.for(coderetreats)}
 
    it "displays the coderetreats which are in the 'not_started' status" do
      expect{|b| presenter.not_started(&b) }.to yield_successive_args(not_started)
    end

    it "displays the coderetreats which are in the 'in_session' status" do
      expect{|b| presenter.in_session(&b) }.to yield_successive_args(in_session)
    end

    it "displays the coderetreats which are in the 'on_break' status" do
      expect{|b| presenter.on_break(&b) }.to yield_successive_args(on_break)
    end
  end
end
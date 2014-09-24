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

    describe "#grouped_by_status" do
      it "shows the statuses for the coderetreats" do
        expected_statuses = ["in_session", "on_break", "not_started"]
        presenter = CoderetreatApp::Coderetreats::Presenters::Collection.for([])
        presenter.grouped_by_status do |status, _|
          expected_statuses.delete status
        end
        expect(expected_statuses).to eq([])
      end

      it "yields the coderetreats associated to the statuses" do
        yielded_coderetreats = {}
        presenter.grouped_by_status do |status, coderetreats|
          yielded_coderetreats[status] = coderetreats
        end
        expect(yielded_coderetreats["in_session"]).to eq([in_session])
        expect(yielded_coderetreats["on_break"]).to eq([on_break])
        expect(yielded_coderetreats["not_started"]).to eq([not_started])
      end
    end
  end
end
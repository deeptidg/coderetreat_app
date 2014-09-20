require 'coderetreats'
#require 'coderetreats/presenters/collection'

#Coderetreat = Struct.new :status, :location

class CoderetreatsController < ApplicationController
  def running_today
=begin
      @coderetreats = Object.new
      def @coderetreats.not_started(&block)
      [
      Coderetreat.new("not_started", "Chicago"),
      Coderetreat.new("not_started", "Seattle")
      ].each(&block)
      end
      def @coderetreats.in_session(&block)
      [
      Coderetreat.new("in_session", "Berlin")
      ].each(&block)
      end
=end
    coderetreats = [
      Coderetreat.new("not_started", "Chicago"),
      Coderetreat.new("not_started", "Seattle"),
      Coderetreat.new("in_session", "Berlin")
    ]
    #@coderetreats = CoderetreatApp::Coderetreats::Presenters::Collection.for(coderetreats)
    @coderetreats = CoderetreatApp::Coderetreats.running_today
  end
end

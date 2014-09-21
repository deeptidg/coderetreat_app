require 'coderetreats'
#require 'coderetreats/presenters/collection'

#Coderetreat = Struct.new :status, :location

class CoderetreatsController < ApplicationController
  def running_today   
    @coderetreats = CoderetreatApp::Coderetreats.running_today
  end
end

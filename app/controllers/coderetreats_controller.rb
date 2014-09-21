require 'coderetreats'
#require 'coderetreats/presenters/collection'

#Coderetreat = Struct.new :status, :location

class CoderetreatsController < ApplicationController
  def running_today   
    @coderetreats = CoderetreatApp::Coderetreats.running_today
  end

  def edit_status
    @coderetreat = Coderetreat.find(params[:id ])
  end
end

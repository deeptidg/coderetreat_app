require 'coderetreats'
require 'coderetreats/status'

class CoderetreatsController < ApplicationController
  def running_today   
    @coderetreats = CoderetreatApp::Coderetreats.running_today
  end
end

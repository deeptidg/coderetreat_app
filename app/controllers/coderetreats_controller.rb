require 'coderetreats'
#require 'coderetreats/presenters/collection'

#Coderetreat = Struct.new :status, :location

class CoderetreatsController < ApplicationController
  def running_today   
    @coderetreats = CoderetreatApp::Coderetreats.running_today
  end

  def edit_status
    @coderetreat = Coderetreat.find(coderetreat_id)
  end

  def update_status
    CoderetreatApp::Coderetreats::Status.update_to(coderetreat_id, params[:new_status])
    redirect_to edit_status_coderetreat_url(coderetreat_id)
  end

  private
    def coderetreat_id
      params[:id]
    end
end

require 'coderetreats'
require 'coderetreats/status'

class CoderetreatsController < ApplicationController
  def running_today   
    @coderetreats = CoderetreatApp::Coderetreats.running_today
  end

  def edit_status
    @coderetreat = Coderetreat.find(coderetreat_id)
  end

  def update_status
    puts "The request is received by controller with id = #{coderetreat_id} and new_status = #{params[:new_status]}"
    CoderetreatApp::Coderetreats::Status.update_to(coderetreat_id, params[:new_status])
    redirect_to edit_status_coderetreat_url(coderetreat_id)
  end

  private
    def coderetreat_id
      params[:id]
    end
end

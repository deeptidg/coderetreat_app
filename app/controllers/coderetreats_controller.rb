require 'coderetreats'
require 'coderetreats/status'

class CoderetreatsController < ApplicationController
  def running_today   
    @coderetreats = CoderetreatApp::Coderetreats.running_today
  end

=begin 
  def edit_status
    @coderetreat = Coderetreat.find(coderetreat_id)
  end
=end  

=begin
  def update_status
    puts "The request is received by controller with id = #{coderetreat_id} and new_status = #{params[:new_status]}"
    CoderetreatApp::Coderetreats::Status.update_to(coderetreat_id, params[:new_status])
    redirect_to edit_coderetreat_status_url(coderetreat_id)
  end

  private
    def coderetreat_id
      params[:id]
    end
=end    
end

require 'coderetreats/status'

class StatusController < ApplicationController
  def edit
    @coderetreat = Coderetreat.find(coderetreat_id)
  end

  def update
    CoderetreatApp::Coderetreats::Status.update_to(coderetreat_id, coderetreat_params[:new_status])
    redirect_to edit_coderetreat_status_url(coderetreat_id)
  end

private
  def coderetreat_id
    params[:coderetreat_id]
  end

  def coderetreat_params
    params.permit(:new_status)
  end
end
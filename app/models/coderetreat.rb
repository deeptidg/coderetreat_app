require 'coderetreats/statuses'

class Coderetreat < ActiveRecord::Base
  def self.running_today
    all
  end

  def available_next_statuses
    CoderetreatApp::Coderetreats::Statuses.all - [self.status]
  end

  def update_status(new_status)
    self.update_attributes status: new_status
  end
end

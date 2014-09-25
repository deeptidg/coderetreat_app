class Coderetreat < ActiveRecord::Base
  attr_accessor :location, :status

  def self.running_today
    #[]
    all
  end

  def available_next_statuses
    ["not_started", "in_session", "on_break"] - [self.status]
  end

  def update_status(new_status)
    puts "The Coderetreat object receives new_status #{new_status}"
    self.update_attributes status: new_status
  end

end

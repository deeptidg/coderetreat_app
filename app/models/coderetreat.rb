class Coderetreat < ActiveRecord::Base
  attr_accessor :location, :status
  def self.running_today
    #[]
    all
  end
end

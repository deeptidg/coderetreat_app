require 'coderetreats/presenters/collection'
#Coderetreat = Struct.new :status, :location

module CoderetreatApp
  module Coderetreats
    def self.running_today
=begin      
      coderetreats = [
      Coderetreat.new("not_started", "Chicago"),
      Coderetreat.new("not_started", "Seattle"),
      Coderetreat.new("in_session", "Berlin")
      ]
=end      
      Presenters::Collection.for(::Coderetreat.running_today)
    end
  end
end
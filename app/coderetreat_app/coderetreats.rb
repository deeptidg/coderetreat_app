require 'coderetreats/presenters/collection'
#Coderetreat = Struct.new :status, :location

module CoderetreatApp
  module Coderetreats
    def self.running_today    
      Presenters::Collection.for(::Coderetreat.running_today)
    end
  end
end
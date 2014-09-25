require 'coderetreats/statuses'

module CoderetreatApp
  module Coderetreats
    module Presenters
      class Collection

        def self.for(coderetreats)
          new(coderetreats)
        end

        attr_reader :coderetreats
        def initialize(coderetreats)
          @coderetreats = coderetreats
        end

        def self.all_statuses
          CoderetreatApp::Coderetreats::Statuses.all
        end

        def filtered_by_status(status)
          self.coderetreats.select{|cr| cr.status == status}
        end

        def grouped_by_status(&block)
          self.class.all_statuses.each do |status|
            yield status, filtered_by_status(status)
          end
        end

      end
    end
  end
end
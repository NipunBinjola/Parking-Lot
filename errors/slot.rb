# frozen_string_literal; true

module Errors
  module Slot
    class NotFound < StandardError
      def initialize
        super('No such slots found.')
      end
    end
  end
end

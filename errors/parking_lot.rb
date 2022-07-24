module Errors
  module ParkingLot
    class InvalidNumberOfSlots < StandardError
      def initialize
        super('Please Enter valid number of slots.')
      end
    end
    class SlotUnavailable < StandardError
      def initialize
        super('All parking slots are full! Please visit later.')
      end
    end
  end
end

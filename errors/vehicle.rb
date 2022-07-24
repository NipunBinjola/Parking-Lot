module Errors
  module Vehicle
    class InvalidRegistrationNo < StandardError
      def initialize
        super('Registration number seems invalid. Please check again.')
      end
    end
    class InvalidColor < StandardError
      def initialize
        super('Please enter a valid value for color of vehicle.')
      end
    end
    class NotFound < StandardError
      def initialize
        super('Not such vehicles found.')
      end
    end
  end
end

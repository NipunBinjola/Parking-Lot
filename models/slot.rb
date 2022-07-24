# frozen_string_literal: true

module Models
  class Slot
    attr_reader :id, :status
    attr_accessor :vehicle

    def initialize(id:)
      @id = id
      @status = 'free'
      @vehicle = nil
    end

    def free?
      status == 'free'
    end

    def occupied?
      status == 'occupied'
    end
  end
end

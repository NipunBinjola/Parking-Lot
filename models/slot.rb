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

    def assign_vehicle(vehicle)
      @vehicle = vehicle
      @status = 'occupied'
      self
    end

    def remove_vehicle
      @vehicle = nil
      @status = 'free'
    end
  end
end

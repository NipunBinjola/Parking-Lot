# frozen_string_literal: true

module Models
  class ParkingLot
    def initialize(number_of_slots)
      @slots = []
      (1..number_of_slots).each do |slot_id|
        @slots << Slot.new(id: slot_id)
      end
    end

    def available_slot
      slots.each do |slot|
        return slot if slot.free?
      end
      nil
    end

    def get_slot(slot_id)
      slots[slot_id - 1]
    end

    private

    attr_reader :slots
  end
end

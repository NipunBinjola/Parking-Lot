# frozen_string_literal: true

module Models
  class ParkingLot
    def initialize(number_of_slots)
      raise Errors::ParkingLot::InvalidNumberOfSlots unless number_of_slots.class == Integer && number_of_slots.positive?

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

    def slots_with_vehicle(color: nil, registration_no: nil)
      result = []
      add = true
      slots.each do |slot|
        next unless slot.occupied?

        add = slot.vehicle.color == color if color
        add = slot.vehicle.registration_no == registration_no if registration_no

        result << slot if add
      end
      result
    end

    def status
      details = [['Slot No. | Registration No | Colour']]
      slots.each do |slot|
        next if slot.free?

        details << "#{slot.id} | #{slot.vehicle.registration_no} | #{slot.vehicle.color}"
      end
      details
    end

    private

    attr_reader :slots
  end
end

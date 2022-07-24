# frozen_string_literal: true

require_relative './lib/dependencies'
# Main system that runs the parking lot
class ParkingLotSystem
  attr_reader :parking_lot

  def initialize(number_of_slots)
    @parking_lot = Models::ParkingLot.new(number_of_slots)
  rescue StandardError => e
    raise e
  end

  def park(registration_no, color)
    free_slot = parking_lot.available_slot
    begin
      raise Errors::ParkingLot::SlotUnavailable if free_slot.nil?

      vehicle = Models::Vehicle.new(registration_no: registration_no, color: color)
      free_slot.assign_vehicle(vehicle)
    rescue StandardError => e
      raise e
    end
    "Allocated Slot number: #{free_slot.id}\n"
  end

  def leave(slot_id)
    slot = parking_lot.get_slot(slot_id)
    slot.remove_vehicle
    "Slot number #{slot.id} is free.\n"
  end

  def status
    parking_lot.status
  end

  def registration_numbers_for_cars_with_colour(color)
    slots = parking_lot.slots_with_vehicle(color: color)
    raise Errors::Vehicle::NotFound if slots.empty?

    slots.map { |slot| slot.vehicle.registration_no }.to_s
  end

  def slot_numbers_for_cars_with_colour(color)
    slots = parking_lot.slots_with_vehicle(color: color)
    raise Errors::Slot::NotFound if slots.empty?

    slots.map(&:id).to_s
  end

  def slot_number_for_registration_number(registration_no)
    slots = parking_lot.slots_with_vehicle(registration_no: registration_no)
    raise Errors::Slot::NotFound if slots.empty?

    slots.last.id
  end
end

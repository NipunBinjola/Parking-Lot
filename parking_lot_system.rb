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

  def park(registration_no, color); end

  def leave(slot_id); end

  def status; end

  def registration_numbers_for_cars_with_colour(color); end

  def slot_numbers_for_cars_with_colour(color); end

  def slot_number_for_registration_number(registration_no); end
end

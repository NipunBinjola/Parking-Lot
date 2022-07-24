# frozen_string_literal: true

module Models
  # require './errors/vehicle'
  class Vehicle
    attr_reader :registration_no
    attr_reader :color

    def initialize(registration_no:, color:)
      @registration_no = registration_no
      @color = color
      raise Errors::Vehicle::InvalidRegistrationNo unless valid_registration_no?
      raise Errors::Vehicle::InvalidColor unless valid_color?

      self
    end

    private

    def valid_color?
      color.class == String and !color.empty?
    end

    def valid_registration_no?
      registration_no.class == String and !registration_no.empty?
    end
  end
end
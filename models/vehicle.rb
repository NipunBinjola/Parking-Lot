# frozen_string_literal: true

module Models
  class Vehicle
    attr_reader :registration_no
    attr_reader :color

    def initialize(registration_no:, color:)
      @registration_no = registration_no
      @color = color
      self
    end
  end
end

# frozen_string_literal: true

module SystemDriver
  class FileIo
    require './parking_lot_system'

    attr_reader :file_path, :file, :parking_lot_system

    def initialize(filepath)
      @file_path = filepath
      @file = File.readlines(filepath).map(&:chomp)
      init_command = file.first.split
      raise 'Invalid input file!' unless init_command.first == 'create_parking_lot'

      @parking_lot_system = ParkingLotSystem.new(init_command[1].to_i)
      puts "Created a parking lot with #{init_command[1]} slots."
    end

    def execute; end
  end
end

filepath = 'system_driver/input.txt'
SystemDriver::FileIo.new(filepath).execute

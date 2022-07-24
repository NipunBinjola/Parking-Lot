# frozen_string_literal: true

module SystemDriver
  class FileIo
    require './parking_lot_system'

    attr_reader :file_path, :parking_lot_system, :commands

    def initialize(filepath)
      @file_path = filepath
      file = File.readlines(filepath).map(&:chomp)
      init_command = file.first.split
      raise 'Invalid input file!' unless init_command.first == 'create_parking_lot'

      @parking_lot_system = ParkingLotSystem.new(init_command[1].to_i)
      @commands = file[1..-1]
      puts "Created a parking lot with #{init_command[1]} slots."
    end

    def execute
      commands.each do |input_line|
        input = input_line.split
        command = input.first
        begin
          case command
          when 'park'
            puts parking_lot_system.park(input[1], input[2])
          when 'leave'
            puts parking_lot_system.leave(input[1].to_i)
          when 'status'
            puts parking_lot_system.status
          when 'registration_numbers_for_cars_with_colour'
            puts parking_lot_system.registration_numbers_for_cars_with_colour(input[1])
          when 'slot_numbers_for_cars_with_colour'
            puts parking_lot_system.slot_numbers_for_cars_with_colour(input[1])
          when 'slot_number_for_registration_number'
            puts parking_lot_system.slot_number_for_registration_number(input[1])
          else
            raise 'Invalid input line!'
          end
        rescue StandardError => e
          puts e.message
        end
      end
    end
  end
end

filepath = 'system_driver/input.txt'
SystemDriver::FileIo.new(filepath).execute

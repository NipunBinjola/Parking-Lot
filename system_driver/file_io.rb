# frozen_string_literal: true

module SystemDriver
  class FileIo
    require './parking_lot_system'

    attr_reader :file_path, :file

    def initialize(filepath)
      @file_path = filepath
      @file = File.readlines(filepath).map(&:chomp)
    end

    def execute; end
  end
end

filepath = 'system_driver/input.txt'
SystemDriver::FileIo.new(filepath).execute

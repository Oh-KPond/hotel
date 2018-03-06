require_relative 'room'
require_relative 'block_rooms'
require_relative 'reservation'

module HotelBooking
  class HotelAdmin

    attr_reader :all_rooms, :all_blocks, :reservations

    def initialize

      all_rooms = []
      (1..20).each do |num|
        all_rooms << HotelBooking::Room.new(num)
      end

      @all_rooms = all_rooms
      @all_blocks = []
      @reservations = []

    end
  end
end

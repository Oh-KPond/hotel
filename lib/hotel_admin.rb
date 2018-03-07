require 'pry'

require_relative 'room'
require_relative 'block_rooms'
require_relative 'reservation'

module HotelBooking
  class HotelAdmin

    attr_reader :all_rooms, :all_blocks, :reservations

    NUMBER_OF_ROOMS = 20

    def initialize

      all_rooms = []
      (1..NUMBER_OF_ROOMS).each do |id|
        all_rooms << HotelBooking::Room.new(id)
      end

      @all_rooms = all_rooms
      @all_blocks = []
      @reservations = []

    end

    def find_room(id)
      check_id(id)

      @all_rooms.select {|single_room| single_room.id == id}
    end

    def make_reservation(reservation)

      @reservations << reservation

      return reservation
    end

    private

    def check_id(id)
      if id == nil || id <= 0 || id > 20
        raise ArgumentError.new("Room ID cannot be blank , more than 20, or less than zero. (got #{id})")
      end
    end
  end
end

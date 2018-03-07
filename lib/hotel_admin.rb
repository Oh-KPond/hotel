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
      room = @all_rooms.select {|single_room| single_room.id == id}

      if room.empty?
        raise ArgumentError.new("That is an invalid room")
      end

      return room
    end

    def make_reservation(reservation)
      
      @reservations << reservation

      return reservation
    end
  end
end

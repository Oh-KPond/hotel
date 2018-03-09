require 'pry'

require_relative 'block_rooms'
require_relative 'reservation'

module HotelBooking
  class HotelAdmin

    attr_reader :all_rooms, :all_blocks, :reservations

    NUMBER_OF_ROOMS = 20

    def initialize

      all_rooms = []
      (1..NUMBER_OF_ROOMS).each do |id|
        all_rooms << id
      end

      @all_rooms = all_rooms
      @all_blocks = []
      @reservations = []
    end

    def find_room(id)
      check_id(id)

      @all_rooms.select {|single_room| single_room == id}
    end

    def find_reservations_by_date(date)
      begin
        search_date = Date.parse(date)
      rescue ArgumentError => exception
        puts "Could not convert date to Date class: #{exception}"
      end

      @reservations.find_all { |reservation| reservation.dates.find {|dates| dates == search_date} }
    end

    def make_reservation(first_night, night_count, room_id)

      new_reservation ={
        first_night: first_night,
        night_count: night_count,
        room: find_room(room_id)
      }

      reservation = Reservation.new(new_reservation)
      @reservations << reservation
      return reservation
    end

    private

    def check_id(id)
      if id == nil || id <= 0 || id > NUMBER_OF_ROOMS
        raise ArgumentError.new("Room ID cannot be blank , more than 20, or less than zero. (got #{id})")
      end
    end
  end
end

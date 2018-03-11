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


    def find_reservations(date)
      unless date.instance_of? Date
        search_date = Date.parse(date)
      end

      @reservations.find_all { |reservation| reservation.dates.include?(search_date) }
    end

    def find_availiblity(first_night, night_count)

      # TODO: if night count is greater than one generate dates loop though generated dates to create an array of array. Flatten arrays, remove duplicates with .uniq
      reservations = find_reservations(first_night)
      booked_rooms = reservations.map { |reservation| reservation.room }
      availible_rooms = @all_rooms - booked_rooms

      return availible_rooms
    end

    def make_reservation(first_night, night_count, room_id)
      check_id(room_id)
      availible_rooms = find_availiblity(first_night, night_count)
      unless availible_rooms.include?(room_id)
        raise ArgumentError.new("#{room_id} is not availible the availble rooms are #{availible_rooms}")
      end

      new_reservation ={
        first_night: first_night,
        night_count: night_count,
        room: room_id
      }

      reservation = Reservation.new(new_reservation)
      @reservations << reservation
      return reservation
    end

    private

    def check_id(id)
      if id == nil || id <= 0 || id > NUMBER_OF_ROOMS
        raise ArgumentError.new("Room ID cannot be blank, more than 20, or less than zero. (got #{id})")
      end
    end
  end
end

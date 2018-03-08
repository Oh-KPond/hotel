require 'date'

module HotelBooking
  class Reservation

    attr_reader :start_date, :num_nights, :room

    def initialize(first_night, num_nights, room_id)

      start_date = Date.parse(first_night)

      @start_date = start_date
      @num_nights = num_nights
      @room = room_id
    end
  end
end

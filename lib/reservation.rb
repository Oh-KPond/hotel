require 'date'

module HotelBooking
  class Reservation

    attr_reader :start_date, :num_nights, :room

    COST_PER_NIGHT = 200.00

    def initialize(first_night:, num_nights:, room:)

      start_date = Date.parse(first_night)

      @start_date = start_date
      @num_nights = num_nights
      @room = room
    end
  end
end

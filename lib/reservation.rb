require 'date'

module HotelBooking
  class Reservation

    attr_reader :start_date, :num_nights, :rooms

    def initialize(first_night, num_nights, rooms)

      start_date = Date.parse(first_night)

      @start_date = start_date
      @num_nights = num_nights
      @rooms = rooms
    end
  end
end

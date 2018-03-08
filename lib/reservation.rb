require 'date'

require "pry"

module HotelBooking
  class Reservation

    attr_reader :start_date, :num_nights, :room, :dates

    COST_PER_NIGHT = 200.00

    def initialize(first_night:, num_nights:, room:)

      start_date = Date.parse(first_night)

      @start_date = start_date
      @num_nights = num_nights
      @room = room
      @dates = [start_date]

      dates_generator

    end

    def dates_generator

      (@num_nights - 1).times do
        date = @start_date += 1
        @dates << date
      end

      return dates
    end

  end
end

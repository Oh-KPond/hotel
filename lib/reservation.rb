require 'date'

require "pry"

module HotelBooking
  class Reservation

    attr_reader :start_date, :night_count, :room, :dates

    COST_PER_NIGHT = 200.00

    def initialize(first_night:, night_count:, room:)

      start_date = Date.parse(first_night)

      @start_date = start_date
      @night_count = night_count
      @room = room
      @dates = [start_date]

      dates_generator

    end

    def dates_generator

      (@night_count - 1).times do
        date = @start_date += 1
        @dates << date
      end

      return dates
    end

  end
end

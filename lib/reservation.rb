require 'date'

require "pry"

module HotelBooking
  class Reservation

    attr_reader :start_date, :night_count, :room, :dates

    COST_PER_NIGHT = 200.00

    def initialize(first_night:, night_count:, room:)
      check_night_count(night_count)

      start_date = Date.parse(first_night)

      unless start_date >= Date.today
        raise ArgumentError.new("Room can not be reserved for a date before today.")
      end

      @start_date = start_date
      @night_count = night_count
      @room = room
      @dates = dates_generator(night_count, start_date)

    end

    def check_night_count(num)
      if num <= 0
        raise ArgumentError.new("The number of nights for a reservation can not be less than 1. Recieved #{num}")
      end
    end

    def dates_generator(night_count, start_date)
      dates = [start_date]
      (night_count - 1).times do
        date = start_date += 1
        dates << date
      end

      return dates
    end

    def total_cost
      (@night_count * COST_PER_NIGHT)
    end

  end
end

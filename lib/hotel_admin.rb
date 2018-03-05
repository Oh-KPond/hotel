require_relative 'room'
require_relative 'block_rooms'
require_relative 'reservation'

module HotelBooking
  class HotelAdmin

    attr_reader :all_rooms, :all_blocks, :reservations

    def initialize
      @all_rooms = []
      @all_blocks = []
      @reservations = []

    end
  end
end

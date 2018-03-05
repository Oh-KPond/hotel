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

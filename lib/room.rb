module HotelBooking
  class Room

    attr_reader :id, :cost

    COST_PER_NIGHT = 200.00
    
    def initialize(id)
      unless id > 0
        raise ArgumentError.new("ID must be a positive number.")
      end

      @id = id
      @cost = COST_PER_NIGHT
    end

  end
end

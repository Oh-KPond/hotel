module HotelBooking
  class Room

    attr_reader :id, :cost

    def initialize(id, cost)
      unless id > 0
        raise ArgumentError.new("ID must be a positive number.")
      end

      unless cost > 0
        raise ArgumentError.new("Cost must be a positive number.")
      end

      @id = id
      @cost = cost
    end

  end
end

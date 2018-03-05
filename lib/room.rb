module HotelBooking
  class Room

    attr_reader :id, :cost

    def initialize(id)
      unless id > 0
        raise ArgumentError.new("ID must be a positive number.")
      end
      
      @id = id
      @cost = 200.00
    end

  end
end

require_relative 'spec_helper'

describe "Reservation class" do
  describe "initialize" do
    before do
      first_night = '2018-10-3'
      num_nights = 3
      @reservation = HotelBooking::Reservation.new(first_night, num_nights)
    end

    it "establishes the base data structures when instantiated" do

      @reservation.must_be_instance_of HotelBooking::Reservation

      @reservation.must_respond_to :start_date
      @reservation.must_respond_to :num_nights

      @reservation.start_date.must_be_kind_of Date
      @reservation.num_nights.must_be_kind_of Integer

    end
  end
end


# reservation should create reservations
# reservation should have an id, start date for reservation, number of nights booked
# reservation should caluate total cost of reservation
# keep track what rooms are booked for a reservation
# keep track of dates a room is booked
# check dates for availible all_rooms

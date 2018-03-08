require_relative 'spec_helper'

describe "Reservation class" do

  describe "initialize" do
    before do
      first_night = '2018-10-3'
      num_nights = 3
      room_id = 1
      @reservation = HotelBooking::Reservation.new(first_night, num_nights, room_id)
    end

    it "establishes the base data structures when instantiated" do

      @reservation.must_be_instance_of HotelBooking::Reservation

      @reservation.must_respond_to :start_date
      @reservation.must_respond_to :num_nights
      @reservation.must_respond_to :room

      @reservation.start_date.must_be_kind_of Date
      @reservation.num_nights.must_be_kind_of Integer
      @reservation.room.must_be_kind_of Integer

    end
  end

  describe "total reservation cost" do
    before do
      first_night = '2018-10-3'
      num_nights = 3
      room_id = 1
      @reservation = HotelBooking::Reservation.new(first_night, num_nights, room_id)
    end

    it "caluates the total cost of a reservation" do

    end
  end

  describe "rooms_availible" do
    # using date, this should find and return a collection of availible rooms
    # throw error if no rooms availible for date
  end
end

# reservation should caluate total cost of reservation
# keep track what rooms are booked for a reservation
# keep track of dates a room is booked
# check dates for availible all_rooms

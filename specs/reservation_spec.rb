require_relative 'spec_helper'

describe "Reservation class" do

  describe "initialize" do
    before do
      new_reservation = {
        first_night: '2018-10-3',
        night_count: 3,
        room: 1
      }
      @reservation = HotelBooking::Reservation.new(new_reservation)
    end

    it "establishes the base data structures when instantiated" do

      @reservation.must_be_instance_of HotelBooking::Reservation

      @reservation.must_respond_to :start_date
      @reservation.must_respond_to :night_count
      @reservation.must_respond_to :room
      @reservation.must_respond_to :dates

      @reservation.start_date.must_be_kind_of Date
      @reservation.night_count.must_be_kind_of Integer
      @reservation.room.must_be_kind_of Integer
      @reservation.dates.must_be_kind_of Array

    end
  end

  describe "dates generator" do
    it "creates a collection of dates for reservation" do
      new_reservation = {
        first_night: '2018-10-3',
        night_count: 3,
        room: 1
      }
      reservation = HotelBooking::Reservation.new(new_reservation)

      reservation.dates.must_be_kind_of Array
      reservation.dates.first.must_be_kind_of Date
      reservation.dates.first.must_equal Date.parse('2018-10-3')
      reservation.dates.last.must_equal Date.parse('2018-10-5')
    end
  end

  describe "total reservation cost" do
    before do
      new_reservation = {
        first_night: '2018-10-3',
        night_count: 3,
        room: 1
      }
      @reservation = HotelBooking::Reservation.new(new_reservation)
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

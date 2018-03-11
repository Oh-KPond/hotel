require_relative 'spec_helper'

require "pry"

describe "Hotel Admin class" do
  describe "initialize" do
    before do
      @admin = HotelBooking::HotelAdmin.new
    end

    it "establishes the base data structures when instantiated" do

      @admin.must_be_instance_of HotelBooking::HotelAdmin

      @admin.must_respond_to :all_rooms
      @admin.must_respond_to :all_blocks
      @admin.must_respond_to :reservations

      @admin.all_rooms.must_be_kind_of Array
      @admin.all_blocks.must_be_kind_of Array
      @admin.reservations.must_be_kind_of Array

    end

    it "creates a collection of all_rooms" do


      @admin.all_rooms.first.must_equal 1
      @admin.all_rooms.last.must_equal 20
    end
  end


  describe "make_reservation" do
    before do
      @admin = HotelBooking::HotelAdmin.new
    end

    it "creates a new reservation" do
      first_night = '2018-10-3'
      night_count = 3
      room_id = 1

      reservation = @admin.make_reservation(first_night, night_count, room_id)

      reservation.must_be_instance_of HotelBooking::Reservation
    end

    it "throws error if room is not valid room in hotel" do
      first_night = '2018-10-3'
      night_count = 3
      room_id = 30

      proc {@admin.make_reservation(first_night, night_count, room_id)}.must_raise ArgumentError
    end
  end

  describe "find_reservations by date" do
    before do
      @admin = HotelBooking::HotelAdmin.new

      @admin.make_reservation('2018-10-2', 2, 20)
      @admin.make_reservation('2018-10-3', 2, 1)
      @admin.make_reservation('2018-10-3', 2, 2)
      @admin.make_reservation('2018-10-3', 2, 3)
      @admin.make_reservation('2018-11-5', 2, 1)
      @admin.make_reservation('2018-12-6', 2, 1)
    end

    it "finds a collection of reservations for a date" do

      @admin.find_reservations('2018-10-3').must_be_kind_of Array
      @admin.find_reservations('2018-10-3').first.room.must_equal 20
      @admin.find_reservations('2018-10-3').last.room.must_equal 3
    end

    it "returns an empty array of there are no reservations for a date" do

      @admin.find_reservations('2019-1-3').must_be_kind_of Array
      @admin.find_reservations('2019-1-3').must_equal []
      @admin.find_reservations('2019-1-3').length.must_equal 0
    end
  end

  describe "find_availiblity by date" do
    before do
      @admin = HotelBooking::HotelAdmin.new

      @admin.make_reservation('2018-10-2', 2, 20)
      @admin.make_reservation('2018-10-3', 2, 1)
      @admin.make_reservation('2018-10-3', 2, 2)
      @admin.make_reservation('2018-10-3', 2, 3)
      @admin.make_reservation('2018-11-5', 2, 1)
      @admin.make_reservation('2018-12-6', 2, 1)

      20.times do |room_id|
        room_id += 1
        @admin.make_reservation('2018-12-9', 2, room_id)
      end

    end

    it "returns a collection of rooms that are not assoicated with a reservation" do

      rooms_availible = @admin.find_availiblity('2018-10-3', 1)

      rooms_availible.must_be_kind_of Array
      rooms_availible[0].must_equal 4
      rooms_availible.length.must_equal 16
    end

    it "returns an empty array of there are no rooms_availible" do

      rooms_availible = @admin.find_availiblity('2018-12-9', 1)

      rooms_availible.must_be_kind_of Array
      rooms_availible.length.must_equal 0
    end
  end
end

require_relative 'spec_helper'

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

      @admin.all_rooms.first.must_be_instance_of HotelBooking::Room

      @admin.all_rooms.first.id.must_equal 1
      @admin.all_rooms.last.id.must_equal 20
    end
  end

  describe "make_reservation" do
    before do
      @admin = HotelBooking::HotelAdmin.new
    end

    it "creates a new reservation" do
      first_night = '2018-10-3'
      num_nights = 3
      room = 1

      reservation = @admin.make_reservation(first_night, num_nights, room)

      reservation.must_be_instance_of HotelBooking::Reservation
    end

    it "throws error if room is not valid room in hotel" do
      first_night = '2018-10-3'
      num_nights = 3
      room = 30

      proc {@admin.make_reservation(first_night, num_nights, room)}.must_raise ArgumentError

    end
  end
end

# the hotel admin should start by seeing all the rooms, all the blocks, and all of the reservations

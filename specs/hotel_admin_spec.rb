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

  describe "find_reservations_by_date" do
    it "finds a reservation by date" do

    end

    it "finds a collection of reservations for a date" do

    end

    it "raises an error for an invalid date" do

    end
  end
  # availible rooms
    # finds reservations by date... makes an array of rooms in those find_reservations_by_date
    # finds room id not in that array that is a valid room id (or finds all room ids in reservations found.. orders them and then )

end

# the hotel admin should start by seeing all the rooms, all the blocks, and all of the reservations

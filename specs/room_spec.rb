require_relative 'spec_helper'

describe "Room class" do
  describe "initialize" do
    before do
      @room_one = HotelBooking::Room.new(1)
    end

    it "can create a new instance of Room" do
      # Arrange/Given
      # Act/When
      # Assert/Then
      @room_one.must_be_instance_of HotelBooking::Room
    end

    it "establishes the base data structures when instantiated" do

      @room_one.must_respond_to :id
      @room_one.must_respond_to :cost

      @room_one.id.must_be_kind_of Integer
      @room_one.cost.must_be_kind_of Float
    end

    it "requires a positive id" do
      # common sense dictates that you wouldn't have a room with a negative id

      proc { HotelBooking::Room.new(-5) }.must_raise ArgumentError
    end
  end
end

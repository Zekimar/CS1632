require 'minitest/autorun'
require_relative 'city_sin_9006'


#UNIT TESTS FOR METHOD Place.setStreets
#EQUIVALENCE CLASSES:
# @street1 = test1 -> returns true
# @street2 = test2 -> returns true

class PlaceStreetTest < Minitest::Test
  #uses stubbing to ensure that street1 is proprly assigned to the
  #value of a given variable
  def test_street_1
    street1 = nil
    test1 = "test"
    street1 = test1
    assert_equal "test", street1
  end

  def test_street_2
    street2 = nil
    test2 = "test2"
    street2 = test2
    assert_equal "test2", street2
  end

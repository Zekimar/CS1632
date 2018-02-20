require 'minitest/autorun'
require_relative '../Place'
require_relative '../Driver'

 # UNIT TESTS FOR METHOD Place.initialize
 # EQUIVALENCE CLASSES:
 # x = Place object -> returns not nil
 # x = y, z -> raises error
 # x = y, y != String -> raises error

class PlaceInitTest < Minitest::Test
  #ensures that a Place object is not nil when created
  def test_new_place_not_nil
    pl = Place::new "t"
    refute_nil pl
  end

  #ensures argument is thrown
  def test_wrong_arguments
    assert_raises "wrong number of arguments" do
      pl = Place::new "hello", "There"
    end
  end

  #ensures that an exception is thrown if the name is not a String
  #EDGE CASE
  def test_wrong_argument_type
    assert_raises "name should be a string" do
      pl = Place::new 12
    end
  end
end

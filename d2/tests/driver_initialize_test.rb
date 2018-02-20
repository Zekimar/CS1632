require 'minitest/autorun'
require_relative '../Place'
require_relative '../Driver'

# Unit tests for Driver.initialize method
# EQUIVALENCE CLASSES:
# @name is set properly
# @location is set properly
# exception is thrown when location is not a Place object
# @toys is instantiated properly
# @books is instantiated properly
# @classes is instantiated properly

class DriverInitTest < Minitest::Test

  #ensures name is equal to parameter
  def test_name
    testPlace = Place::new "Test"
    d = Driver::new "Driver 1", testPlace
    assert_equal "Driver 1", d.name
  end

  #ensures location is equal to parameter
  def test_location
    testPlace = Place::new "Test"
    d = Driver::new "Driver 1", testPlace
    assert_equal testPlace, d.location
  end

  #throws error if location is not a Place object
  def test_location_type
    testPlace = Place::new "Test"
    d = Driver::new "Driver 1", testPlace
    assert_raises "location must be Place object" do
      ded = Driver::new "driver 1", "driver 1"
    end
  end

  #ensures that variable is instantiated to the proper value
  def test_toys
    testPlace = Place::new "Test"
    d = Driver::new "Driver 1", testPlace
    assert_equal d.toys, 0
  end

  #ensures that variable is instantiated to the proper value
  def test_books
    testPlace = Place::new "Test"
    d = Driver::new "Driver 1", testPlace
    assert_equal d.books, 0
  end

  #ensures that variable is instantiated to the proper value
  def test_classes
    testPlace = Place::new "Test"
    d = Driver::new "Driver 1", testPlace
    assert_equal d.classes, 1
  end
end

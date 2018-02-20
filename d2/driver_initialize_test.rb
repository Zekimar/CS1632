require 'minitest/autorun'
require_relative 'city_sim_9006'

# Unit tests for Driver.initialize method
# EQUIVALENCE CLASSES:
# @name is set properly
# @location is set properly
# exception is thrown when location is not a Place object
# @toys is instantiated properly
# @books is instantiated properly
# @classes is instantiated properly

class DriverInitTest < Minitest::Test
  testPlace = Place::new "Test"
  d = Driver::new "Driver 1", testPlace

  #ensures name is equal to parameter
  def test_name
    assert_equal "Driver 1", d.name
  end

  #ensures location is equal to parameter
  def test_location
    assert_equal testPlace, d.location
  end

  #throws error if location is not a Place object
  def test_location_type
    assert_raises "location must be Place object" do
      ded = Driver::new "driver 1", "driver 1"
    end
  end

  #ensures that variable is instantiated to the proper value
  def test_toys
    assert_equal d.toys, 0
  end

  #ensures that variable is instantiated to the proper value
  def test_books
    assert_equal d.books, 0
  end

  #ensures that variable is instantiated to the proper value
  def test_classes
    assert_equal d.classes, 1
  end
end 

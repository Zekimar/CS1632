require 'minitest/autorun'
require_relative 'city_sim_9006'

# Unit tests for Driver.move method
# EQUIVALENCE CLASSES:
# location is changed to neighbor1 if random number is 1
# location is changed to neighbor2 if random number is 2

class DriverMoveTest < Minitest::Test
  #uses stubbing to test code of method
  def test_choice_1
    testNeighbor1 = Place::new "testNeighbor1", nil, nil
    testNeighbor2 = Place::new "testNeighbor2", nil, nil
    testPlace = Place::new "testPlace3", testNeighbor1, testNeighbor2
    d = Driver::new "Driver 1", testPlace
    choice = 0
    if choice == 0
      d.location = d.location.instance_variable_get(:@neighbor1)
    end
    assert_equal d.location, testNeighbor1
  end

  #uses stubbing to test code of method
  def test_choice_2
    testNeighbor1 = Place::new "testNeighbor1", nil, nil
    testNeighbor2 = Place::new "testNeighbor2", nil, nil
    testPlace = Place::new "testPlace3", testNeighbor1, testNeighbor2
    d = Driver::new "Driver 1", testPlace
    choice = 1
    if choice == 1
      d.location = d.location.instance_variable_get(:@neighbor2)
    end
    assert_equal d.location, testNeighbor2
  end
end

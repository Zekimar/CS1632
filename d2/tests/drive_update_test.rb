require 'minitest/autorun'
require_relative '../Place'
require_relative '../Driver'

# Unit tests for Driver.update method
# EQUIVALENCE CLASSES:
# @books is updated when location == "Hillman"
# @toys is updated when location == "Museum"
# @classes is updated when location == "Cathedral"
# 1 variable is incrementing at a time
class DriverUpdateTest < Minitest::Test

  #tests if books increments by 1 when location == "Hillman"
  def test_books_update
    pl = Place::new "eeeee"
    d = Driver::new "Hello", pl
    d.update "Hillman"
    assert_equal d.books, 1
  end

  #tests if toys increments by 1 when location == "Museum"
  def test_toys_update
    pl = Place::new "eeeee"
    d = Driver::new "Hello", pl
    d.update "Museum"
    assert_equal d.toys, 1
  end

  #tests if classes doubles when location == "Cathedral"
  #method is called twice to ensure that it is doubled, not incremented by 1
  def test_classes_update
    pl = Place::new "eeeee"
    d = Driver::new "Hello", pl
    d.update "Cathedral"
    d.update "Cathedral"
    assert_equal d.classes, 4
  end

  #ensures that toys is not incrementing when location is "hillman"
  #EDGE CASE
  def test_other_args_not_incrementing
    pl = Place::new "eeeee"
    e = Driver::new "hello", pl
    e.update "Hillman"
    refute_equal e.toys, 1
  end
end

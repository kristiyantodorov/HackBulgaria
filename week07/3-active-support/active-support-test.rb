require 'test/unit'
require_relative 'active-support'

class MyTest < Test::Unit::TestCase
  def test_blank
    assert([].blank?)
  end

  def test_presence
    assert([].presence == nil)
    assert([1, 2].presence == [1, 2])
  end
end

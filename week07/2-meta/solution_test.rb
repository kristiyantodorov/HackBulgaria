require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  def test_proxy
    proxy = Proxy.new [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    assert(proxy.send(:size) == 10, 'bla')
  end

  def test_to_proc
    assert([2, 3, 4, 5].map(&'succ.succ') == [4, 5, 6, 7])
  end
end

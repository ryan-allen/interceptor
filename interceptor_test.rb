require 'test/unit'
require 'interceptor'

class InterceptorTest < Test::Unit::TestCase
  def setup
    @object = [1,3,2,5,4]
    @wrapper = Interceptor.new(@object)
  end

  def test_sort_works_as_we_expect_before_intercept
    assert_equal [1,2,3,4,5], @wrapper.sort
  end

  def test_our_sort_intercept_reverses_the_sort
    @wrapper.intercept(:sort) { |r, t, *a| r.sort.reverse }
    assert_equal [5,4,3,2,1], @wrapper.sort
  end

  def test_we_are_passed_the_receiver
    @wrapper.intercept(:[]) { |r, t, *a| r }
    assert_equal @object, @wrapper[0]
  end

  def test_we_are_passed_the_target
    @wrapper.intercept(:[]) { |r, t, *a| t }
    assert_equal :[], @wrapper[0]
  end

  def test_we_are_passed_the_args
    @wrapper.intercept(:[]) { |r, t, *a| a }
    assert_equal [0], @wrapper[0]
  end
end

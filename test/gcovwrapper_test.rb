require 'test/unit'
require_relative "../lib/icoveralls/gcov_wrapper"

include Icoveralls

class GCovWrapperTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_gcovexists

    # To change this template use File | Settings | File Templates.
    assert_true GcovWrapper.GcovInstalled?
  end
  def test_gcovwrapper_init
      assert_raise do
        a = GcovWrapper.new
      end

    assert_not_nil(GcovWrapper.instance)
  end
end

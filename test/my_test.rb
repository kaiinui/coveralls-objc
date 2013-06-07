require 'test/unit'
require '../lib/icoveralls/project_valider'

include Icoveralls

class MyTest < Test::Unit::TestCase

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
  def test_project_valider
    # T change this template use File | Settings | File Templates.
    assert_false ProjectValider.validProject("/")
  end

end
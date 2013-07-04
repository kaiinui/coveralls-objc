require 'test/unit'
require '../lib/icoveralls/coveralls_sender'
require '../lib/icoveralls/gcov_wrapper'

include Icoveralls
class CoverallsSenderTest < Test::Unit::TestCase

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
  def test_commit
    # To change this template use File | Settings | File Templates.
     a = GcovWrapper.instance
    src_file = a.cover_pathname("/Users/yaya/Library/Developer/Xcode/DerivedData/Peeler-felspnidhcrmdwdrwjfogbkrttoz/Build/Intermediates/Peeler.build/Debug/Peeler.build/Objects-normal/x86_64/")

      coveralls_sender = CoverallsSender.new("cSCWZdYZPP0HT5nyH1oxOkfe0U16dPZzu","travis-ci",src_file)
      coveralls_sender.commit

  end
end
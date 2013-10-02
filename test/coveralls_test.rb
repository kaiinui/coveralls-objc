require 'test/unit'
require_relative '../lib/icoveralls/coveralls_sender'
require_relative '../lib/icoveralls/gcov_wrapper'

require_relative '../lib/icoveralls/git'

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
     src_file = a.cover_pathname("/Users/yaya/Library/Developer/Xcode/DerivedData/Peeler-hfzcyonesoxsyagsotmbnpydftxw/Build/Intermediates/Peeler.build/Debug/Peeler.build/Objects-normal/x86_64")
     coveralls_sender = CoverallsSender.new("ZpetHnxjI1aRh7n8qEtpHUrz7QRJrGGFJ","travis-ci",src_file)

      puts Icoveralls::gitrepo('/Users/yaya/Dev/github/Peeler')
      coveralls_sender.printHash
     coveralls_sender.commit

  end
end

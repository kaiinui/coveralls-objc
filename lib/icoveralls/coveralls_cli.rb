require 'thor'
require '../lib/icoveralls/coveralls_sender'
require '../lib/icoveralls/gcov_wrapper'

module Icoveralls

  class CoverallsCLI < Thor
      desc "cover PROJECT", "cover and send to travis-ci"
      def cover(project)
        puts "Covers project : #{project} with Travis_JOB_ID : #{ENV['TRAVIS_JOB_ID']}"
      end
      # To change this template use File | Settings | File Templates.
  end

end

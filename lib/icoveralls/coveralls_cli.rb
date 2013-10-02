require 'thor'
require 'icoveralls/coveralls_sender'
require 'icoveralls/gcov_wrapper'

module Icoveralls

  class CoverallsCLI < Thor
    desc "cover PROJECT", "cover and send to travis-ci"
    desc "token TOKEN", "coveralls token"
    
    def cover(project)
      puts "Covers project : #{project} with Travis_JOB_ID : #{ENV['TRAVIS_JOB_ID']}"
    end
  end
end

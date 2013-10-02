require 'thor'
require 'xcodeproj'

require_relative 'coveralls_sender'
require_relative 'gcov_wrapper'

include Xcodeproj

module Icoveralls
  class CoverallsCLI < Thor
    desc "cover PROJECT", "cover the project"
    class_option :token, :aliases => "-t", :desc => "The coveralls token if not using travis-ci"
    def cover(project_path)
        extension = File.extname(project_path)
      if extension.eql? ".xcodeproj"
            project = Project.new(project_path)
            project.initialize_from_file

            generate_test_coverage = project.build_settings('GCC_GENERATE_TEST_COVERAGE_FILES')
            generate_program_flow = project.build_settings('GCC_INSTRUMENT_PROGRAM_FLOW_ARCS')

            if(!generate_program_flow or !generate_program_flow)
                puts "Warning: GCC_GENERATE_TEST_COVERAGE_FILES and GCC_INSTRUMENT_PROGRAM_FLOW_ARCS are not set to YES"
            end

        elsif  extension.eql? ".xcworkspace"
            puts "is workspace"
      else
            puts "is unknwown"
      end
    end
  end
end

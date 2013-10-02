require 'pathname'
require 'singleton'

module Icoveralls

  class GcovWrapper
    include Singleton
    def initialize

      if not self.class.GcovInstalled?
        raise "gcov was not found in path. Check your environment variables"
      end

      version_info = `gcov --version`

      @@gcov_version = version_info.split("\n")[0]

      puts "Use gcov at path:" + @@gcov_path
      puts "Use gcov version:" + @@gcov_version
    end

    @source_files_coverage = []

    def cover_pathname(pathname)

      source_files = []
      currentPath = Dir.pwd

      Dir.chdir(pathname)
      Dir.glob("*.gcno") do |gcno|

        puts "Analysing coverage of:#{gcno}"
        result = `#{@@gcov_path} #{gcno}`
      end

      Dir.glob("*.{m,mm,c}.gcov") do |gcov|

        puts "Reading coverage for files: #{gcov}"

        source_files << self.class.GcovToHash(Pathname.new("#{pathname}/#{gcov}"))

      end

      Dir.chdir(currentPath)

      source_files
    end

    def self.GcovInstalled?
      path_directories = ENV['PATH'].split(":")
      found = false
      path_directories.each do |dir|

        begin
          directory = Dir.new(dir)
        rescue
          puts "Warning: could not open :" + dir  + ". Fix your $PATH to suppress warning"
          next
        end
        directory.each do |file|

          if(file == "gcov")
            found = true
            @@gcov_path = dir + "/" + file
            break
          end
        end
        if found
          break
        end
      end
      return found
    end

    def self.GcovToHash(gcov_pathname)

      coverages = []
      source = ""
      File.open(gcov_pathname).each_line do |line|

        line_array = line.split(":")
        line_number = line_array[1].delete(" ").to_i

        if(line_number == 0)
          next
        end

        coverage_counter = line_array[0].delete(" \n")

        if(coverage_counter == '-')
          coverage_counter = nil
        elsif (coverage_counter == "#####")
          coverage_counter = 0
        else
          coverage_counter = coverage_counter.to_i
        end

        coverages << coverage_counter
        source << line_array[2].force_encoding("UTF-8")

      end
      puts "Analysis of file:#{gcov_pathname.basename}"
      puts "Ocurrence of EOL:#{source.lines.count}"
      puts "Covered lines :#{coverages.count}"

      return { :name => gcov_pathname.basename.to_s.chomp(".gcov") , :source => source, :coverage => coverages}
    end
  end
end

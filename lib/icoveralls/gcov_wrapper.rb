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


    def cover_pathname(pathname)

      currentPath = Dir.pwd

      Dir.chdir(pathname)
      Dir.glob("*.gcno") do |gcno|

        puts "Analysing coverage of:#{gcno}"
        result = `gcov #{gcno}`
        puts result

      end

      Dir.chdir(currentPath)
    end

    def self.GcovInstalled?
      path_directories = ENV['PATH'].split(":")
      found = false
      path_directories.each do |dir|

        begin
          directory = Dir.new(dir)
        rescue
          puts "Error by opening :" + dir  + ". Check your $PATH"
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
    # To change this template use File | Settings | File Templates.
  end

end
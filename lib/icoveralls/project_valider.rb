require 'pathname'

module Icoveralls

class ProjectValider

  def self.validProject(project_path)
     if not Dir.exist?(project_path)
           puts "Directory does not exists"

           return false
     else
                       #.xcodeproject #.xcodeworkspace
        if(project_path[-13,13] == ".xcodeproject")

          return false
        elsif(project_path[-15,15] == ".xcodeworkspace")

               return true
             else
               puts "Give path does not corresponds to a xcode project"
               return false
        end

       return true

     end


  end
  # To change this template use File | Settings | File Templates.
end


end
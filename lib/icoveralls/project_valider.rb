require 'pathname'

module Icoveralls

  class ProjectValider

    def self.validProject(project_path)

      if(project_path.length < 15 and project_path[-13,13]  != ".xcodeproject" and project_path[-15,15] != ".xcodeworkspace" )
        return false

      end

      return true
    end

  end


end

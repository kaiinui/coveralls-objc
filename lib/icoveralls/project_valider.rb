require 'pathname'

module Icoveralls

class ProjectValider

  def self.validProject(project_path)

      if Dir.exist?(project_path)

        pn = Pathname.new(project_path)


    end

  end
  # To change this template use File | Settings | File Templates.
end


end
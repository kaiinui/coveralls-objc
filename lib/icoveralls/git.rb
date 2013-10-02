module Icoveralls


  def gitlog(format)

    `git --no-pager 'log' -1 --format='#{format}'`.strip
  end



  def gitrepo(pathname)

    Dir.chdir(pathname)

    {
      :head => {

        :id => self.gitlog('%H'),
        :author_name => self.gitlog('%aN'),
        :author_email => self.gitlog('%ae'),
        :commiter_name => self.gitlog('%cN'),
        :commiter_email => self.gitlog('%ce'),
        :message => self.gitlog('%s'),
      },
      :branch => `git rev-parse --abbrev-ref HEAD`.strip,
      :remotes => remoteHash(pathname)
    }
  end

  def remoteHash(pathname)

    Dir.chdir(pathname)

    remotes = []
    `git remote -v`.lines.each do |line|
      if line['(fetch)']
        remotes << {
          :name => line.split()[0],
          :url => line.split()[1]
        }
      end
    end
    remotes
  end
end

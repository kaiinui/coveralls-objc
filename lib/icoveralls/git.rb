module Icoveralls


	def gitlog(format)

		`git --no-pager 'log' -l --pretty-format:#{format}`
	end



	def self.gitrepo(pathname)

		Dir.chdir(pathname)

		{
			:head => {

				:id => self.gitlog('%H'),
				:author_name => self.gitlog('%aN'),
				:author_email => self.gitlog('%ae'),
				:commiter_name => self.gitlog('%cN'),
				:commiter_email => self.gitlog('%ce'),
				:message => self.gitlog('%s'),
					}
		}

	end
end

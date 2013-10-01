require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/coveralls_test.rb']
  test.verbose = true
end

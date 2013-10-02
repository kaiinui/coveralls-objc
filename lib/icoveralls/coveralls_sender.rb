require 'rest_client'
require 'multi_json'
require 'tempfile'
require 'icoveralls/git'

module Icoveralls

  class CoverallsSender

    def initialize(repo_token, sources_files_hash, git_hash)

      @json_file_hash = {}

      if not defined? repo_token
        @json_file_hash[:service_name] = 'travis-ci'
        @json_file_hash[:service_job_id] = ENV['TRAVIS_JOB_ID']
      else
        @json_file_hash[:service_name] = 'coveralls-objc'
        @json_file_hash[:repo_token] = repo_token
      end

      @json_file_hash[:repo_token]= repo_token
      @json_file_hash[:sources_files] = sources_files_hash
      @json_file_hash[:git] = git_hash

    end

    def commit
      response = RestClient.post 'https://coveralls.io/api/v1/jobs', :json_file => self.class.hash_to_file(@json_file_hash)
      puts MultiJson.load(response.to_str)
    end

    def self.hash_to_file(hash)
      file = nil
      Tempfile.open(['coveralls-upload', 'json']) do |f|
        f.write(MultiJson.dump hash, :pretty => false)
        file = f
      end
      File.new(file.path, 'rb')
    end

    def printHash
      puts MultiJson.dump @json_file_hash, :pretty => true
    end
  end
end

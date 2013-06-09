require 'rest_client'
require 'multi_json'
require 'tempfile'

module Icoveralls

  class CoverallsSender

    # To change this template use File | Settings | File Templates.

    def initialize(repo_token,service_name, sources_files_hash)

      @json_file_hash = {

          :repo_token => repo_token,
          :service_name => service_name,
          :sources_files => sources_files_hash
      }

    end

    def commit

       json_file = MultiJson.dump(@json_file_hash, :pretty => true)
    #  File.open("/Users/yaya/file.json",'w+') do |f|
     #   f.write json_file
     # end

      # response = RestClient.post 'https://coveralls.io/api/v1/jobs', File.read('/Users/yaya/file.json'), :content_type => 'text/plain;charset=UTF-8'
      # response_hash = MultiJson.load(response.to_str)
    end

    def self.hash_to_file(hash)
      file = nil
      Tempfile.open(['icoveralls-upload', 'json']) do |f|
        f.write(MultiJson.dump hash)
        file = f
      end
      File.new(file.path, 'rb')
    end
  end
  end
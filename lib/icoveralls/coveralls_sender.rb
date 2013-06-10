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

       response = RestClient.post 'https://coveralls.io/api/v1/jobs', :json_file => self.class.hash_to_file(@json_file_hash)
       response_hash = MultiJson.load(response.to_str)
    end

    def self.hash_to_file(hash)
      file = nil
      Tempfile.open(['icoveralls-upload', 'json']) do |f|
        f.write(MultiJson.dump hash, :pretty => true)
        file = f
      end
      File.new(file.path, 'rb')
    end
  end
  end
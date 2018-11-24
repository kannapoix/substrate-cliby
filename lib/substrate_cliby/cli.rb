require 'net/http'
require 'uri'
require 'json'
require 'substrate_cliby'
require 'thor'

module SubstrateCliby
  class CLI < Thor
    def initialize *args
      super
      @base_uri = 'http://localhost:9933'
    end

    desc "chain_getHead", "get header"
    def chain_getHead
      res = post_request URI(@base_uri + '/chain_getHead')
      puts get_result to_json res
    end

    desc "chain_getRuntimeVersion", "get runtime version"
    def chain_getRuntimeVersion
      res = post_request URI(@base_uri + '/chain_getRuntimeVersion')
      puts get_result to_json res
    end

    desc "system_chain", "get chain type"
    def system_chain
      res = post_request URI(@base_uri + '/system_chain')
      puts get_result to_json res
    end

    desc "system_version", "get version"
    def system_version
      res = post_request URI(@base_uri + '/system_version')
      puts get_result to_json res
    end

    desc "system_name", "get name"
    def system_name
      res = post_request URI(@base_uri + '/system_name')
      puts get_result to_json res
    end

    desc "system_properties", "system_properties"
    def system_properties
      res = post_request URI(@base_uri + '/system_properties')
      puts get_result to_json res
    end

    private

    def post_request uri
      req = Net::HTTP::Post.new uri
      req["Content-Type"] = "application/json"
      req["Accept"] = "application/json"
      Net::HTTP.start uri.hostname, uri.port do |http|
        http.request req
      end
    end

    def to_json payload
      JSON.load(payload.body)
    end

    def get_result json
      json['result']
    end
  end
end

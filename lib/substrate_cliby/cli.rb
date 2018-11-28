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
      @uri = URI @base_uri
      @rpc_version = '2.0'
    end

    desc "chain_getHead", "get header"
    def chain_getHead
      method_name = __method__.to_s
      req = build_request method_name
      res = post_request req
      puts get_result from_json res
    end

    desc "chain_getHeader", "get header from block hash"
    def chain_getHeader block_hash=nil
      method_name = __method__.to_s
      req = build_request method_name, block_hash
      res = post_request req
      puts get_result from_json res
    end

    desc "chain_getRuntimeVersion", "get runtime version"
    def chain_getRuntimeVersion
      method_name = __method__.to_s
      req = build_request method_name
      res = post_request req
      puts get_result from_json res
    end

    desc "system_chain", "get chain type"
    def system_chain
      method_name = __method__.to_s
      req = build_request method_name
      res = post_request req
      puts get_result from_json res
    end

    desc "system_version", "get version"
    def system_version
      method_name = __method__.to_s
      req = build_request method_name
      res = post_request req
      puts get_result from_json res
    end

    desc "system_name", "get name"
    def system_name
      method_name = __method__.to_s
      req = build_request method_name
      res = post_request req
      puts get_result from_json res
    end

    desc "system_properties", "system_properties"
    def system_properties
      method_name = __method__.to_s
      req = build_request method_name
      res = post_request req
      puts get_result from_json res
    end

    private

    def build_request method_name, *params
      req = Net::HTTP::Post.new @uri
      req.body = { jsonrpc: @rpc_version, method: method_name, params: params, id: 1 }.to_json
      req
    end

    def post_request req
      req["Content-Type"] = "application/json"
      Net::HTTP.start @uri.hostname, @uri.port do |http|
        http.request req
      end
    end

    def from_json payload
      JSON.load payload.body
    end

    def get_result respond_hash
      respond_hash['result']
    end
  end
end

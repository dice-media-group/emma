# NB:
# The role of query depends on the method.  For example the post method 
# transfers the query values to the body as json while the get method
# could potentially send the query as is with the submission.

class HubspotConnection
    attr_accessor(:api_version, :api_key)
    # https://rubygems.org/gems/hubspot-api-client
    require 'uri'
    require 'net/http'
    require 'openssl'

    DEFAULT_API_VERSION = "3"
    DEFAULT_BASE_URI    = "https://api.hubapi.com/crm"
    DEFAULT_QUERY       = {}
    DEFAULT_API_KEY     = ENV["HUBSPOT_API_KEY"]


    def initialize(api_version: DEFAULT_API_VERSION, query: DEFAULT_QUERY, api_key: DEFAULT_API_KEY)
        @api_version    = api_version
        @query          = query
        @connection     = self.class
        @api_key        = api_key
    end

    def query(params={})
        @query.update(params)
    end

    def get(relative_path, query={})
        relative_path = add_api_version(relative_path)
        base_and_path = DEFAULT_BASE_URI + relative_path
        puts "###"
        puts "base_and_path #{base_and_path} "
        puts "###"
        url = URI("#{base_and_path}?limit=10&paginateAssociations=false&archived=false&hapikey=#{DEFAULT_API_KEY}")

        puts "###"
        puts "url: #{url}"

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["accept"] = 'application/json'

        response = http.request(request)
        puts response.read_body
        # response.read_body
        # connection.get relative_path, query: @query.merge(query)
    end

    def post(relative_path, query={})
        # https://rubygems.org/gems/hubspot-api-client    
        relative_path   = add_api_version(relative_path)
        base_and_path   = DEFAULT_BASE_URI + relative_path
        body            = query.to_json
        puts "### post"
        puts "relative_path #{relative_path} "
        puts "query #{query} "
        puts "base_and_path #{base_and_path} "
        puts "###"
        url = URI("#{base_and_path}?hapikey=#{DEFAULT_API_KEY}")

        puts "###"
        puts "url: #{url}"

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Post.new(url)
        request["accept"] = 'application/json'
        request["content-type"] = 'application/json'
        request.body = body

        response = http.request(request)
        puts response.read_body
        response.read_body
    end


    private

    attr_reader :connection

    def add_api_version(relative_path)
    "/#{api_version_path}#{relative_path}"
    end

    def api_version_path
    "v" + @api_version.to_s
    end
end

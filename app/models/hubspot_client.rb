class HubspotClient
    attr_reader(:connection, :routes)
    
    def initialize(connection:, routes:)
        @connection = connection
        @routes     = routes
    end

    def method_missing(query_method, *request_arguments)
        # super unless respond_to?(query_method)

        # puts "Method #{query_method} called with #{request_args}"
        # retrieve the route map
        puts "###"
        puts "query method #{query_method} "
        puts "request_arguments #{request_arguments} "
        puts "body #{request_arguments.first} "
        puts "###"
        route_map = routes.fetch(query_method)
    
        # make request via the connection
        response_from_route(route_map, request_arguments)
    end

    def respond_to_missing?(method, include_private = false)
        ROUTES.any? { |route| route == method.to_sym  } || super
    end

    def response_from_route(route_map, request_arguments)
        # gather the routes required parameters
        http_method     = route_map.fetch(:method)
        relative_path   = route_map.fetch(:path)
        body            = request_arguments.first

        # puts "### response_from_route"
        # puts "http_method #{http_method} "
        # puts "relative_path #{relative_path} "
        # puts "body #{body} "
        # puts "###"

        # puts "Response from route:" [http_method.to_s, relative_path.to_s]
        # puts "request_arguments: #{request_arguments} "
        # call the connection for records
        connection.send(http_method, relative_path, *request_arguments)
    end
end

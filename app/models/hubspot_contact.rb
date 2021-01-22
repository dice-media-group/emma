class HubspotContact
    attr_reader(:connection, :client)

    ROUTES = {
        contact_create: {
            path: "/objects/contacts",
            method: "post"
        },
        contact_show: {
            path: "/objects/contacts",
            method: "get"
        },
        contact_update: {
            path: "/objects/contacts",
            method: "put"
        },
        delete_contact: {
            path: "/objects/contacts",
            method: "delete"
        },
        contacts: {
            path: "/objects/contacts",
            method: "get"
        }            
    }
    def initialize(connection: HubspotConnection.new)
        @connection = connection.query(hapikey: ENV["HUBSPOT_API_KEY"])
        @client     = HubspotClient.new(connection: connection, routes: ROUTES)
    end

    def list
        client.contacts
    end

    def create(body_hash)
        contact_details = {}
        contact_details[:properties] = body_hash
        client.contact_create(contact_details)
    end
end
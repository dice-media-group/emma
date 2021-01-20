class HubspotClient

    require 'uri'
    require 'net/http'
    require 'openssl'

    YOUR_HUBSPOT_API_KEY = "cc142a22-8659-4609-a66d-3d1c030bfac9"
    
    
    def send_contact_info(contact_params)
        prop_hash = {}
        prop_hash["properties"] = contact_params
        # request.body = "{\"properties\":{\"company\":\"Biglytics\",\"email\":\"bcooper@biglytics.net\",\"firstname\":\"Bryan\",\"lastname\":\"Cooper\",\"phone\":\"(877) 929-0687\",\"website\":\"biglytics.net\"}}"
        url = URI("https://api.hubapi.com/crm/v3/objects/contacts?hapikey=cc142a22-8659-4609-a66d-3d1c030bfac9")
    
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        
        request = Net::HTTP::Post.new(url)
        request["accept"] = 'application/json'
        request["content-type"] = 'application/json'
        request.body = "{\"properties\":{\"company\":\"Biglytics\",\"email\":\"bcooper@biglytics.net\",\"firstname\":\"Bryan\",\"lastname\":\"Cooper\",\"phone\":\"(877) 929-0687\",\"website\":\"biglytics.net\"}}"
        
        response = http.request(request)
        puts response.read_body
    
    end

    def _contact_params(params)
        lead = OpenStruct.new(params).lead || {}
    end
end

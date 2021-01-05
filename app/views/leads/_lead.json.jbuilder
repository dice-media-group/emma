json.extract! lead, :id, :name, :phone, :email_address, :subject, :message_body, :created_at, :updated_at
json.url lead_url(lead, format: :json)

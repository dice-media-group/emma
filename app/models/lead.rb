# for now, it's just easier to use hubspot's form
# this class is inactive.
# We might use this with hubspot or another API in the furture.

class Lead
    include ActiveModel::Model

    attr_accessor   :name, :phone, :email_address, :subject, :message_body
    validates       :name, :phone, :email_address, presence: true


    def save
        # puts "name: #{self.attributes} "
        if valid?
            lead_params_hash = {name:self.name, phone:self.phone, email_address:self.email_address, subject:self.subject, message_body:self.message_body}
            @lead = OpenStruct.new(lead_params_hash)
            # @lead = self.new(params[:lead]) 
            # send email
            # send a text
            # send to hubspot api
            self.create_contact_on_hubpspot(lead_params_hash)
            # possibly create a ne`w record on local db
            # Lead.create(params)
            #LeadMailer.message(params).deliver_later

            puts "================================"
            puts "saving the message #{@lead} "
            puts "================================"

            self.notify_sales_team(lead_params_hash)
            self.be_in_touch_soon(lead_params_hash)
            true
        else
            false
        end
    end

    def join_mailing_list
        ActiveRecord::Type::Boolean.new.cast(@join_mailing_list)
    end

    def create_contact_on_hubpspot(lead_params_hash)
        # https://www.opgenmedia.com/blog/hubspot-api-lead-generation
        hubspot_contact_hash = self.convert_lead_to_hubspot_format(lead_params_hash)
        hc = HubspotContact.new
        hc.create(hubspot_contact_hash)
    end

    def convert_lead_to_hubspot_format(lead_params_hash)
        hubspot_contact_hash = {}

        full_name   = lead_params_hash[:name].split(" ")
        lastname    = full_name.pop
        firstname   = full_name.join(" ")
        email       = lead_params_hash[:email_address]
        
        hubspot_contact_hash[:email]        = email
        hubspot_contact_hash[:firstname]    = firstname
        hubspot_contact_hash[:lastname]     = lastname

        hubspot_contact_hash
    end

    def notify_sales_team(lead)
        @users = User.contact_notification_team
        @users.each do |user|
            UserNotifierMailer.alert_about_contact(user, lead).deliver_later            
        end
    end

    def be_in_touch_soon(lead)
        NotificationMailer.be_in_touch_soon(lead).deliver_later
    end

    def send_welcome_signup_email
        @user = User.first
        UserNotifierMailer.send_signup_email(@user).deliver_later        
    end
end

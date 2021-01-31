class NotificationMailer < ApplicationMailer
    def welcome
        mail(to: "carl@dicemediagroup.com", subject: "Welcome to our app")
    end

    def be_in_touch_soon(lead_email_address)
        mail( :to => lead_email_address,
        :subject => 'We will be in touch soon.' )          
    end
end

class NotificationMailer < ApplicationMailer
    def welcome
        mail(to: "carl@dicemediagroup.com", subject: "Welcome to our app")
    end
end

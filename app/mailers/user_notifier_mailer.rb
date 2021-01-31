class UserNotifierMailer < ApplicationMailer
    default :from => 'carl@dicemediagroup.com'

    # send a signup email to the user, pass in the user object that   contains the user's email address
    def send_signup_email(user)
      @user = user
      mail( :to => @user.email,
      :subject => 'Thanks for signing up for our amazing app' )
    end    

    def alert_about_contact(user, lead)
      mail( :to => @user.email,
      :subject => 'New sales lead' )
    end    

end

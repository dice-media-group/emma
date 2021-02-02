ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password =>  "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",
  :domain => 'dicemediagroup.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
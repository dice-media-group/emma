ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'dicemediagroup.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
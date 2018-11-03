# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# specify your ActionMailer settings to point to SendGrid's servers
ActionMailer::Base.smtp_settings = {
  :user_name => 'william63',
  :password => 'William1030',
  #:domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
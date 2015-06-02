# Load the Rails application.
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
    :user_name => 'Dumanik13',
    :password => 'Durman4ik',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}

# Initialize the Rails application.
Rails.application.initialize!

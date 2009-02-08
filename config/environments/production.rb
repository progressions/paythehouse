# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Enable threaded mode
# config.threadsafe!

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true

# Use a different cache store in production
# config.cache_store = :mem_cache_store

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false

# Restful Authentication
REST_AUTH_SITE_KEY = 'f5945d1c74d3502f8a3de8562e5bf21fe3fec887'
REST_AUTH_DIGEST_STRETCHES = 10

config.action_controller.cache_store = [:file_store, "#{RAILS_ROOT}/tmp/cache"]

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false

# Don't care if the mailer can't send
config.action_mailer.raise_delivery_errors = false

MAIL_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/config.yml")['mailer']

config.action_mailer.delivery_method = :smtp

config.action_mailer.smtp_settings = {
  :address  => MAIL_CONFIG['address'],
  :port  => MAIL_CONFIG['port'], 
  :domain  => MAIL_CONFIG['domain'],
  :user_name  => MAIL_CONFIG['user_name'],
  :password  => MAIL_CONFIG['password'],
  :authentication  => :login
}


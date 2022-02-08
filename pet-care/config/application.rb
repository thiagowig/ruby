require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PetCare
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    Dotenv::Railtie.load

    ActionMailer::Base.delivery_method = :smtp

    ActionMailer::Base.smtp_settings = {
      :user_name => ENV['MAILER_USER_NAME'],
      :password => ENV['MAILER_PASSWORD'],
      :address => ENV['MAILER_ADDRESS'],
      :domain => ENV['MAILER_DOMAIN'],
      :port => ENV['MAILER_PORT'],
      :authentication => :plain
    }

  end
end

require File.expand_path('../boot', __FILE__)

require 'rails/all'

require "firebase_token_generator"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module FirebaseRails
  class Application < Rails::Application
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
  end
end

require File.expand_path('../boot', __FILE__)

require 'rails/all'

if Rails.env.development?
  require 'webmock'
  include WebMock::API
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module LearningStyleManager
  AUTH_SERVER_URI = 'http://10.41.68.100/utils/authenticate.php'

  if Rails.env.development?
    # When in development, use a webmock stub for the external authentication server
    @@sample_logins = {
      :student_login => {
        :username => "bjo123",
        :password => "BTC"
      },

      :teacher_login => {
        :username => "blair",
        :password => "WhoLetHimOut"
      },

      :bad_login => {
        :username => "swagmaster",
        :password => "yolo"
      }
    }
	  stub_request(:post, LearningStyleManager::AUTH_SERVER_URI).
    to_return(:body => lambda { |request|
      data = Rack::Utils.parse_nested_query request.body
      if data['uName'] == @@sample_logins[:student_login][:username] and data['pWord'] == @@sample_logins[:student_login][:password]
        # Student Login
        # see db/seeds.rb
        return '{"student": {"cohort":2014,"name":"Bobby Jo","eq_id":"bjo123"}}'
        
      elsif data['uName'] == @@sample_logins[:teacher_login][:username] and data['pWord'] == @@sample_logins[:teacher_login][:password]
        # Teacher Login
        return '{"teacher":{}}'
        
      else
      	# Bad login
      	return '{"error":1}'
      end
    })
  end

  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brisbane'
  end
end

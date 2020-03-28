require "rails/railtie"
require "bad_json_request_handler/version"

module BadJsonRequestHandler
  class Railtie < ::Rails::Railtie
    initializer  'railtie.configure_rails_initialization' do |app|
      app.config.middleware.insert_after ActionDispatch::DebugExceptions, Middleware
    end
  end

  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      begin
        @app.call(env)
      rescue ActionDispatch::Http::Parameters::ParseError => error
        error_output = "Invalid request payload: #{error}"

        if env['CONTENT_TYPE'] =~ /application\/json/
          return [
            400,
            { "Content-Type" => "application/json" },
            [ { errors: { message: error_output } }.to_json ]
          ]
        else
          raise error, error_output
        end
      end
    end
  end
end

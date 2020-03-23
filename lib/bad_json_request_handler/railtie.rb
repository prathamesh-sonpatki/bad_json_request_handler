module BadJsonRequestHandler
  class Railtie < ::Rails::Railtie
    initializer  'railtie.configure_rails_initialization' do |app|
      app.config.add_middleware.insert_after ActionDispatch::DebugExceptions, BadJsonRequestHandler::Middleware
    end
  end
end
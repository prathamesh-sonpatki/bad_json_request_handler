Rails.application.config.middleware.insert_after ActionDispatch::DebugExceptions, BadJsonRequestHandler::Middleware

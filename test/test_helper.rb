$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "bad_json_request_handler"

require "bundler/setup"
Bundler.require(:development)
require "minitest/autorun"

Combustion.path = "test/internal"
Combustion.initialize! :action_controller

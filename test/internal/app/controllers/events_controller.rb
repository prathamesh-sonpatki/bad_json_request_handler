class EventsController < ActionController::Base
  def create
    params
    head :ok
  end
end

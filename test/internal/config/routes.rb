# frozen_string_literal: true

Rails.application.routes.draw do
  constraints format: :json do
    resources :events, only: [:create]
  end
end

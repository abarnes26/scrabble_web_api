Rails.application.routes.draw do
  root "welcome#index"

  get "/word_validator", to: "word_validator#validate"

  namespace :api do
    namespace :v1 do
      get 'games/:id', to: "games#show"
      post 'games/:id/plays', to: "plays#create"
    end
  end
end

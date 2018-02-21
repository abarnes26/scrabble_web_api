Rails.application.routes.draw do
  root "welcome#index"

  get "/word_validator", to: "word_validator#validate"
end

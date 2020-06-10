Rails.application.routes.draw do
  get "/surgeries", to: "surgeries#index"
  get "/surgeries/new", to: "surgeries#new"
  post "/surgeries", to: "surgeries#create"
  get "/surgeries/:id", to: "surgeries#show"
  patch "/surgeries/:id", to: "surgeries#update"
end

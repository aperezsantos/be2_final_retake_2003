Rails.application.routes.draw do
  get "/surgeries", to: "surgeries#index"
  get "/surgeries/new", to: "surgeries#new"
  post "/surgeries", to: "surgeries#create"
end

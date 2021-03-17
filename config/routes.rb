Rails.application.routes.default_url_options[:host] = "localhost:3000"

Rails.application.routes.draw do
  resources :sellers
  resources :listings
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

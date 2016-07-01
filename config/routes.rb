Rails.application.routes.draw do

  resources :hotels
  get "static_pages/help", as: "help"
  get "static_pages/about", as: "about"
  get "static_pages/contact", as: "contact"
  root 'hotels#index'

end

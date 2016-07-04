Rails.application.routes.draw do

  devise_for :users
  resources :users
  get 'users/:id' => 'users#destroy', :as => :admin_destroy_user
  resources :hotels do
    resources :reviews
  end
  get "static_pages/help", as: "help"
  get "static_pages/about", as: "about"
  get "static_pages/contact", as: "contact"
  root 'hotels#index'

end

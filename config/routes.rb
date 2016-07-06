Rails.application.routes.draw do

  devise_for :users
  resources :users

  resources :hotels do
    resources :reviews
  end

  get '/help' => 'static_pages#help'
  get '/about' => 'static_pages#about'
  get '/contact' => 'static_pages#contact'
  root 'hotels#index'

end

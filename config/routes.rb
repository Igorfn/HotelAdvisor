HotelAdvisor::Application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: 'json'} do
      resources :hotels do
        resources :reviews
      end
      resources :reviews
      resources :users
    end
  end

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

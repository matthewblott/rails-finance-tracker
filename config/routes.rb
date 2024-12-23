Rails.application.routes.draw do
  devise_for :users
  # devise_for :users do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  
  get '/my_portfolio', to: 'users#my_portfolio'
  get '/search_stock', to: 'stocks#search'
  get "up" => "rails/health#show", as: :rails_health_check
  root 'welcome#index'
end

Rails.application.routes.draw do
  devise_for :users
  resources :welcome
  get 'welcome/index'
  root 'welcome#index'

  namespace :admin do
    resources :users

    root "users#index"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

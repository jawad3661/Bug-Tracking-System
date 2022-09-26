Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  namespace :admin do
    resources :users
  end

  namespace :developer do
    resources :projects
  end

  namespace :qa do
    resources :projects
  end

  namespace :manager do
    resources :projects
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

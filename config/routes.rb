Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  namespace :admin do
    resources :users, except: [:new, :create] do
      member do
        patch :update_status
      end
    end
  end

  namespace :developer do
    resources :projects, only: [:index, :show]
  end

  namespace :qa do
    resources :projects, only: [:index, :show]
  end

  namespace :manager do
    resources :projects
  end
end

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
    resources :projects, only: [:index, :show] do
      resources :bugs do
        member do
          patch :update_solver
        end
      end
    end
  end

  namespace :qa do
    resources :projects, only: [:index, :show] do
      resources :bugs
    end
  end

  namespace :manager do
    resources :projects
  end

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'signup' => 'registrations#create'
        post 'signin' => 'sessions#create'
        delete 'signout' => 'sessions#destroy'
      end
      namespace :admin do
        resources :users do
          member do
            patch :update_status
          end
        end
      end
    end
  end

  match '*path' => redirect('/'), via: :get, constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'}

end

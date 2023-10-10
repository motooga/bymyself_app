Rails.application.routes.draw do

  get 'tasks/new'
  get 'home/index'
    
  devise_for :families, controllers: {
    sessions:      'families/sessions',
    passwords:     'families/passwords',
    registrations: 'families/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :families ,only: [:show, :index] do 
    resources :users ,only: [:show] do
      resources :tasks
    end
  end
   root to: 'home#index'

   devise_scope :user do
    authenticated :user do
      root 'users#show', as: :authenticated_user_root
    end
  
    unauthenticated do
      root 'home#index', as: :unauthenticated_user_root
    end
  end
  
  devise_scope :family do
    authenticated :family do
      root 'families#index', as: :authenticated_family_root
    end
  
    unauthenticated do
      root 'home#index', as: :unauthenticated_family_root
    end
  end
end

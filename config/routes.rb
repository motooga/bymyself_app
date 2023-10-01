Rails.application.routes.draw do

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
  resources :families ,only: [:show, :index]
  root to: 'home#index'
end

Rails.application.routes.draw do

  root 'tops#index'
  get 'rooms/own'

  namespace :users do
    resources :accounts, only: %i[show]
    resources :profiles, only: %i[show edit update]
  end

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions:      'users/sessions',
  }

  resources :rooms do
    get 'reservations/confirm', to: 'reservations#confirm'
    post 'reservations/confirm', to: 'reservations#confirm', as: :confirm_reservation

    collection do
      get 'search'
    end
  end

  resources :rooms  
  resources :reservations, only: %i[index create destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  resources :consultations
  resources :prescriptions
  resources :appointments
  resources :patients
  resources :doctors
  resources :people
  # devise_for :users
  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'static_pages/home'
  get 'static_pages/accessdenied'
  get 'static_pages/sam'
  get 'static_pages/sofia'
  get 'static_pages/elena'


  
  resources :patients do
   resources :appointments, only: [:index, :new, :create, :payment]
  end
  
  resources :doctors do
   resources :appointments, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  
  resources :patients do
   resources :prescriptions, only: [:index, :new, :create]
  end
  
  resources :doctors do
   resources :prescriptions, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  
  resources :patients do
   resources :consultations, only: [:index, :new, :create]
  end
  
  root :to => "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

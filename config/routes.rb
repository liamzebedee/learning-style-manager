LearningStyleManager::Application.routes.draw do
  resources(:students, only: [:show]) do
    resources :star, only: [:get, :new, :create, :show], controller: 'star'
    resources :dol5, only: [:get, :new, :create, :show], controller: 'dol5'
    resources :gmit, only: [:get, :new, :create, :show], controller: 'gmit'
    resources :ausidentities, only: [:get, :new, :create, :show], controller: 'ausidentities'
    member do
      get 'dashboard', to: 'students#dashboard'
    end
  end
  
  get "teachers/", to: "teacher#index"
  get "teachers/school-results", to: "teacher#school_results"
  
  root "home#index"
  post "login", to: "home#login"
  get  "logout", to: "home#logout"
end

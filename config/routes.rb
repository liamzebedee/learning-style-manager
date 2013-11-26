LearningStyleManager::Application.routes.draw do
  resources(:students, only: [:index, :show]) do
    resources :star, only: [:get, :new, :create, :show], controller: 'star'
    resources :dol5, only: [:get, :new, :create, :show], controller: 'dol5'
    resources :gmit, only: [:get, :new, :create, :show], controller: 'gmit'
    resources :ausidentities, only: [:get, :new, :create, :show], controller: 'ausidentities'
    member do
      get 'overview', to: 'students#overview'
    end
  end
  
  get "teacher/", to: "teacher#index"
  get "teacher/school-results", to: "teacher#school_results"
  
  root "home#index"
  post "login", to: "home#login"
  post "logout", to: "home#logout"
end

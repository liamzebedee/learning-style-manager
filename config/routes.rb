LearningStyleManager::Application.routes.draw do
  resources(:students, only: [:show]) do
    resources :star, only: [:new, :create, :show], controller: 'star_test'
    resources :dol5, only: [:new, :create, :show], controller: 'dol5_test'
    resources :gmit, only: [:new, :create, :show], controller: 'gmit_test'
    resources :ausidentities, only: [:new, :create, :show], controller: 'ausidentities_test'
    member do
      get 'dashboard', to: 'students#dashboard'
    end
  end
  
  get "teachers/dashboard", to: "teacher#dashboard"
  get "teachers/school-results", to: "teacher#school_results"
  
  root "home#index"
  post "login", to: "home#login"
  get  "logout", to: "home#logout"
end

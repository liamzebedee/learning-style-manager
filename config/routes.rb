LearningStyleManager::Application.routes.draw do
  resources :students, only [:index, :show] do
    resources :STAR, only: [:get, :new, :create, :show]
    resources :DOL5, only: [:get, :new, :create, :show]
    resources :GMIT, only: [:get, :new, :create, :show]
    resources :AusIdentities, only: [:get, :new, :create, :show]
    member do
      get 'overview', to: 'students#overview'
    end
  end
  
  get "teacher/", to: "teacher#index"
  get "teacher/school-results", to: "teacher#school_results"
  
  root to: "home#index"
  post "login", to: "home#login"
  post "logout", to: "home#logout"
end

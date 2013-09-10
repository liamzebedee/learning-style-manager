LearningStyleManager::Application.routes.draw do
  get      "student/", to: "student#index"
  get      "student/test"
  post     "student/test", to: "student#results_update"
  get      "student/results", to: "student#results"

  get      "teacher/", to: "teacher#index"
  get      "teacher/student_results"

  post     "login", to: "home#login"
  root to: "home#index"
end

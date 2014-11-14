RackTrackerTest::Application.routes.draw do
  resources :foos
  root to: 'foos#index'
end

Embertest::Application.routes.draw do
  resources :events
  resources :clients
  root to: "main#index"
end

Housekeep::Application.routes.draw do
  resources :pages, only: [:new, :create]
  root to: 'welcome#index'
end

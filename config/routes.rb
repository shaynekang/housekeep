Housekeep::Application.routes.draw do
  resources :transactions, only: [:new, :create]

  root to: 'welcome#index'
end

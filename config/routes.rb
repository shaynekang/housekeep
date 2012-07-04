Housekeep::Application.routes.draw do
  resources :transactions, only: [:new, :create, :edit, :update, :destroy]

  root to: 'welcome#index'
end

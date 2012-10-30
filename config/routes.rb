Housekeep::Application.routes.draw do
  resources :pages, only: [:new, :create, :edit, :update, :destroy]

  match 'auth/:provider/callback' => 'providers#create'
  match 'logout' => 'providers#destroy', as: :logout

  root to: 'welcome#index'
end

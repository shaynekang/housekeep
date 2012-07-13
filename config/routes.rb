Housekeep::Application.routes.draw do
  resources :pages, except: [:show]

  match 'auth/:provider/callback' => 'providers#create'
  match 'logout' => 'providers#destroy', :as => :logout

  root to: 'welcome#index'
end

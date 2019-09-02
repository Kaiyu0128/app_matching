Rails.application.routes.draw do
  post 'sessions/create' #loginto
  delete 'sessions/destroy'
  get 'sessions/new'
  root 'pages#index'
  get 'pages/help'
  resources :users

end

Rails.application.routes.draw do
  devise_for :users
  resources :my_solves
  root 'timer#index'
  get '/timer/solves'
  get '/timer/index'
  get '/timer/destroy'
  post '/users/sign_up'
end

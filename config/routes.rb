Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, param: :_username
  get '/check_user/:id', to: 'users#check_user', :constraints => { :id => /[^\/]+/ }
  get '/recommended_videos', to: 'users#recommended_videos'
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end

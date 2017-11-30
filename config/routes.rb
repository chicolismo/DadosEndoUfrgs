Rails.application.routes.draw do
  #get 'pacients/index'
  resources 'pacients'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root :to => 'home#index'

  get '/sign_in', :to => 'sessions#sign_in', :as => 'sign_in'
  get '/sign_out', :to => 'sessions#sign_out', :as => 'sign_out'
  post '/create_user_session', :to => 'sessions#new'
end

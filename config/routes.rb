Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



resources :challenges, only: [:index, :show, :create]


resources :users, only: [:show] do
    resources :challenges, only: [:create]
end

get 'users/:user_id/challenges', to: 'challenges#user_challenges'

get '/payments/:user_id/payed_challenges', to: 'challenges#payed_challenges'

get 'login', to: 'session#login'

end

Rails.application.routes.draw do
  get 'movies/index'

  get 'movies/show'

  get 'movies/create'

resources :customers, only: [:index, :show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get '/zomg', to: 'application#zomg', as:'zomg'
end

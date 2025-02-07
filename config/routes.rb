Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/studios', to: 'studios#index'

  get '/movies/:id', to: 'movies#show'

  get '/movies/:id/add_new_actor', to: 'movie_actors#new'

  post '/movies/:id', to: 'actors#create'
end

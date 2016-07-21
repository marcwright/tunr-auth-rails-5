Rails.application.routes.draw do
  root to: 'artists#index'

  resources :artists do
    resources :songs
  end

  get '/sign_in', to: 'users#sign_in'
  post '/sign_in', to: 'users#sign_in!'
  get '/sign_up', to: 'users#sign_up'
  post '/sign_up', to: 'users#sign_up!'
  get '/sign_out', to: 'users#sign_out'



  # # artists routes
  # get     '/artists',          to: 'artists#index'
  # get     '/artists/new',      to: 'artists#new'
  # post    '/artists',          to: 'artists#create'
  #
  # get     '/artists/:id',      to: 'artists#show'
  # get     '/artists/:id/edit', to: 'artists#edit'
  # put     '/artists/:id',      to: 'artists#update'
  # delete  '/artists/:id',      to: 'artists#destroy'
  #
  # # songs routes
  # get     '/songs',          to: 'songs#index'
  # get     '/songs/new',      to: 'songs#new'
  # post    '/songs',          to: 'songs#create'
  #
  # get     '/songs/:id',      to: 'songs#show'
  # get     '/songs/:id/edit', to: 'songs#edit'
  # put     '/songs/:id',      to: 'songs#update'
  # delete  '/songs/:id',      to: 'songs#destroy'
end

Rails.application.routes.draw do
  # get 'records/index'
  # get 'records/new'
  # get 'records/:id/edit' => 'records#edit'
  # get 'records/:id' => 'records#show'
  # post 'records/create' => 'records#create'
  # post 'records/:id/update' => 'records#update'
  
  # get 'pets/index' => 'pets#index'
  # get 'pets/new' => "pets#new"
  # get 'pets/:id/edit' => "pets#edit"
  # get 'pets/:id' => "pets#show"
  # post 'pets/create' => 'pets#create'
  # post 'pets/:id/update' => 'pets#update'
  # post 'pets/:id/destroy' => 'pets#destroy'

  resources :pets do
    resources :records
  end


  get 'signup' => 'users#new'
  get 'login' => 'users#login_form'
  get 'users/:id' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  post '/users/create' => 'users#create'
  post '/users/:id/update' => 'users#update'
  post '/users/:id/destroy' => 'users#destroy'

  post 'login' => 'users#login'
  post 'logout' => 'users#logout'

  get '/' => 'home#top'
end

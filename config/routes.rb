Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'home#index'
  root to: 'home#index'

  resources :recipes
  resources :recipe_types

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/recipes/find_by_ingredients', to: 'recipe#find_by_ingredients'
end

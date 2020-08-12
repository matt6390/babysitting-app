Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'parent_token' => 'parent_token#create'
  post 'user_token' => 'user_token#create'

  # Users
  get "/users" => 'users#index'
  get "/users/:id" => 'users#show'
  post "/users" => 'users#create'
  patch "/users/:id" => 'users#update'
  delete "/users/:id" => 'users#destroy'

  # Parents
  get "/parents" => 'parents#index'
  get "/parents/:id" => 'parents#show'
  post "/parents" => 'parents#create'
  patch "/parents/:id" => 'parents#update'
  delete "/parents/:id" => 'parents#destroy'

  # Kids
  get "/kids" => 'kids#index'
  get "/kids/:id" => 'kids#show'
  post "/kids" => 'kids#create'
  patch "/kids/:id" => 'kids#update'
  delete "/kids/:id" => 'kids#destroy'

  # Medications
  get "/medications" => 'medications#index'
  get "/medications/:id" => 'medications#show'
  post "/medications" => 'medications#create'
  patch "/medications/:id" => 'medications#update'
  delete "/medications/:id" => 'medications#destroy'

  # Kids Medications link
  get "/kids_medications" => 'kids_medications#index'
  get "/kids_medications/:id" => 'kids_medications#show'
  post "/kids_medications" => 'kids_medications#create'
  patch "/kids_medications/:id" => 'kids_medications#update'
  delete "/kids_medications/:id" => 'kids_medications#destroy'

  # Allergies
  get "/allergies" => 'allergies#index'
  get "/allergies/:id" => 'allergies#show'
  post "/allergies" => 'allergies#create'
  patch "/allergies/:id" => 'allergies#update'
  delete "/allergies/:id" => 'allergies#destroy'

  # Kids Allergy link
  get "/kids_allergies" => 'kids_allergies#index'
  get "/kids_allergies/:id" => 'kids_allergies#show'
  post "/kids_allergies" => 'kids_allergies#create'
  patch "/kids_allergies/:id" => 'kids_allergies#update'
  delete "/kids_allergies/:id" => 'kids_allergies#destroy'

  # Needs
  get "/kids_needs" => 'kids_needs#index'
  get "/kids_needs/:id" => 'kids_needs#show'
  post "/kids_needs" => 'kids_needs#create'
  patch "/kids_needs/:id" => 'kids_needs#update'
  delete "/kids_needs/:id" => 'kids_needs#destroy'

  # kids Needs link
  get "/kids_needs" => 'kids_needs#index'
  get "/kids_needs/:id" => 'kids_needs#show'
  post "/kids_needs" => 'kids_needs#create'
  patch "/kids_needs/:id" => 'kids_needs#update'
  delete "/kids_needs/:id" => 'kids_needs#destroy'
end

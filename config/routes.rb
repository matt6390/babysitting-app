Rails.application.routes.draw do
  post 'parent_token' => 'parent_token#create'
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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

get "/medications" => 'medications#index'
get "/medications/:id" => 'medications#show'
post "/medications" => 'medications#create'
patch "/medications/:id" => 'medications#update'
delete "/medications/:id" => 'medications#destroy'

get "/kids_medications" => 'kids_medications#index'
get "/kids_medications/:id" => 'kids_medications#show'
post "/kids_medications" => 'kids_medications#create'
patch "/kids_medications/:id" => 'kids_medications#update'
delete "/kids_medications/:id" => 'kids_medications#destroy'

end

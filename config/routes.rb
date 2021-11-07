Rails.application.routes.draw do
  root 'admin#login'
  post '/' => 'admin#login'
  get 'admin/logout'
  resources :employees
  resources :companies
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

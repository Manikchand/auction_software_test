Rails.application.routes.draw do
  get 'login/sign_out'

  get 'login/login'

  get 'login/log_in'
  post 'login/log_in' => "login#log_in"
  root 'login#login'
  get '/paginated_product/:sort/:page' => "products#paginated_product"
  resources :products
  resources :categories
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

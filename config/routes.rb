Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', registration: 'register' }

  root "city_weathers#new"
  resources :city_weathers
end

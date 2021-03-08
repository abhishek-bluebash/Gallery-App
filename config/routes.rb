Rails.application.routes.draw do
  resources :albums
  root 'albums#index'
  # get "password/reset", to: "password_resets#new"
  # post "password/reset", to: "password_resets#create"
  devise_for :users
  resources :tag
  resources :albums do
    member do
      delete :delete_image_attachment
    end
  end
end

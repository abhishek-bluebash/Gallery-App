Rails.application.routes.draw do
  resources :albums
  root 'albums#index'
  devise_for :users
  resources :tag
  resources :albums do
    member do
      delete :delete_image_attachment
    end
  end
end

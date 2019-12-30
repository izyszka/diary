Rails.application.routes.draw do
  devise_for :users
  get 'welcome/izyszka', to: 'welcome#izyszka'
  root to: 'welcome#index'

  resources :posts do
    resources :comments
  end

  resources :movies do
    resources :rates
  end
end

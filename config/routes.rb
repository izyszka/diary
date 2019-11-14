Rails.application.routes.draw do
  get 'welcome/izyszka', to: 'welcome#izyszka'
  root to: 'welcome#index'

  resources :posts do
    resources :comments
  end

  resources :movies
end

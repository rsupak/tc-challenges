Rails.application.routes.draw do
  get 'welcome/index'

  resources :entries do
    collection { post :import }
  end

  root 'welcome#index'
end

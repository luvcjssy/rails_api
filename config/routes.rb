Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :authors, only: [:index, :show, :create, :update, :destroy] do
        resources :books, only: [:index]
      end

      resources :books, only: [:show, :create, :update, :destroy] do
          get :get_all, on: :collection
      end
    end
  end

  resources :demo_authors, only: [:index]
  resources :demo_books, only: [:index]

  root 'demo_authors#index'

end

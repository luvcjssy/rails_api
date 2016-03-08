Rails.application.routes.draw do
  get 'demo_books/index'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :authors, only: [:index, :show, :create, :update, :destroy] do
        resources :books, only: [:index]
      end

      resources :books, only: [:show, :create, :update, :destroy] do
        collection do
          get :get_all
        end
      end
    end
  end

  resources :demo_authors, only: [:index]
  resources :demo_books, only: [:index]

  root 'demo_authors#index'

end

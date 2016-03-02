Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :authors, only: [:index, :show, :create, :update, :destroy]
      resources :books, only: [:index, :show, :create, :update, :destroy]
    end
  end

end

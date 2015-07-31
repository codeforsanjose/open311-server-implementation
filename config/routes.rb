Rails.application.routes.draw do
  namespace :api do
    namespace :v2 do
      resources :services, except: [:new, :edit]
    end
  end

  root 'utility#index'
end

Rails.application.routes.draw do
  root 'games#new'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get 'auth/:provider/callback' => 'devise/sessions#create'
    get 'auth/failure' => redirect('/')
  end

  resources :games, only: [:create, :update, :show, :index]

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' },
                   controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  
  namespace :api, path: '/' do
    namespace :v1 do 
      resources :games, only: [:update] do
        resources :boards, only: [:create, :show, :show, :update]
        put '/update_status/:status_code', to: 'games#update_status'
      end
    end
  end
end

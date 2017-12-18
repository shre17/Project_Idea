Rails.application.routes.draw do
  resources :ideas
   devise_for :users, controllers: {
     sessions: 'users/sessions', registrations: 'users/registrations'
      }

   devise_scope :user do  
     get '/users/sign_out' => 'devise/sessions#destroy' 
   end    

  root 'home#index'
  
  namespace :admins do
    resources :ideas
  end

end

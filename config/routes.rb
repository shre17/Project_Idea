Rails.application.routes.draw do
  resources :ideas
  devise_for :users, controllers: {
        sessions: 'users/sessions', registrations: 'users/registrations'
      }

  devise_scope :user do  
     get '/users/sign_out' => 'devise/sessions#destroy'     
  end    
  root 'home#index'
  # root 'ideas#custom'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', 
    sessions: 'users/sessions'
  }
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get root to: 'homes#top'
  resources :books
  resources :users

end

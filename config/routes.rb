Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'cas#index'

  resources :cas do
    resources :certificates
  end
end

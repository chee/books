Rails.application.routes.draw do
  resources :bookys

  root 'bookys#new'
end

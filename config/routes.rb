Rails.application.routes.draw do
  devise_for :users, only: [:sessions, :passwords]
  resources :messages, only: [:create]
  root 'pages#welcome'
  resources :events
  resources :attendees
  resources :pages do
    get :welcome, on: :collection
    get :faq, on: :collection
    get :the_weekend, on: :collection
    get :feedback, on: :collection
    get :contact_us, on: :collection
    get :links, on: :collection
  end
end

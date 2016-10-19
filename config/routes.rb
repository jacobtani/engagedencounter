Rails.application.routes.draw do
  devise_for :users, only: [:sessions, :passwords]
  root 'pages#welcome'
  resources :events
  resources :attendees
  controller :pages do
    get :welcome
    get :faq
    get :the_weekend
    get :feedback
  end
end

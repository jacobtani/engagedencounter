Rails.application.routes.draw do
  root 'pages#welcome'
  resources :events
  resources :attendees
  controller :pages do
    get :welcome
    get :faq
    get :the_weekend
    get :comments
  end
end

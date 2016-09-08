Rails.application.routes.draw do
  root 'pages#welcome'
  resources :events
  resources :attendees
  controller :pages do 
    get :welcome
    get :faq
    get :comments
  end
end

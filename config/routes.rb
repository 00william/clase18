Rails.application.routes.draw do
  devise_for :users
  get 'root/home'
  #get 'static_pages/help'
  resources :posts
  resources :usuarios
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Crear un recurso para posteriormente utilizar el CRUD
  resources :articles

  # Pagina principal que se muestra al abrir el servidor
  #root :to => "welcome#index"
  root :to => "static_pages#home"

  # Personalizar ruta a controlador
  get '/ayuda', to: "static_pages#help"

  # API definition
  namespace 'api' do
    namespace 'v1' do
      # We are gotting to list our sources here
      resources :users, :only => [:show, :create, :update, :destroy]
      resources :sessions, :only => [:create, :destroy]
    end
  end

end

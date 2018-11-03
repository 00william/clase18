class ApplicationController < ActionController::Base
    # Solo usuarios registrados pueden ver todas las paginas
    #before_action :authenticate_user!
    # Solo usuarios registrados pueden ver todas las paginas, excepto home y ayuda
    #before_action :authenticate_user!, except: [:home, :help]
    protect_from_forgery with: :null_session
    include Authenticable
end

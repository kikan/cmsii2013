class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  
  before_filter :authentification
  
  # Gestion de l'authentification
  # session[:from] = la page d'où on vient et où on retournera une fois authentifié
  # session[:user] = l'utilisateur connecté
  def authentification
    # si on a un session[:user], on ne fait rien
    # sinon : 
    # - 1. on mémorise la destination voulue dans session[:from]
    # - 2. on redirige l'utilisateur sur la page de login
    if session[:user] or request.original_fullpath == '/login'
    else
      session[:from] = request.original_fullpath
      redirect_to '/login'
    end
  end
end

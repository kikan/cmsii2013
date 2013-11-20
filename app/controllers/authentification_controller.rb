class AuthentificationController < ApplicationController
  
  # GET /login
  def login
    # faire le rendu de la vue authentifications/login.html.erb
  end
  
  def logout
    session.delete(:user)
    redirect_to '/login'
  end
  
  def verification_user_password
#    if params[:login]=="toto" and params[:password]=="titi"
    if User.find_by_login_and_password(params[:login], params[:password])
      # Youpi, c'est ok !
      session[:user] = params[:login]
      redirect_to session[:from]
    else
      # Pas bien : login et mot de passe ne sont pas reconnus
      redirect_to '/login'
    end
  end
  
end

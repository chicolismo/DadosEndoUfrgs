class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Antes de qualquer ação, o usuário precisa estar logado
  before_action :require_login
 
  private
 
  def require_login
    unless logged_in?
      flash[:notice] = "Você precisa estar logado."
      redirect_to '/sign_in' # halts request cycle
    end
  end

  def logged_in?
    session[:user_id]
  end

  def current_user
    if session[:user_id]
      Usuario.find(session[:user_id])
    else
      nil
    end
  end
end

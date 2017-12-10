class SessionsController < ApplicationController
  skip_before_action :require_login, :only => ['sign_in', 'new']

  # Exibe o formulário de login
  def sign_in
    @user = Usuario.new
  end

  # Desloga o usuário e redireciona para a tela de login
  def sign_out
    session.clear
    redirect_to '/sign_in'
  end

  # Recebe os dados do formulário de login e tenta criar uma nova
  # sessão para o usuário
  def new
    user = Usuario.find_by(:email => params[:email])

    if user && user.senha == params[:senha]
      session.clear
      session[:user_id] = user.id_usuario
      flash[:notice] = 'Login realizado com sucesso!'
      redirect_back(:fallback_location => root_path)
    else
      flash[:alert] = 'Dados inválidos'
      redirect_to '/sign_in'
    end
  end
end


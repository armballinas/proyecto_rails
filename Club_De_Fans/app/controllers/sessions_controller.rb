class SessionsController < ApplicationController
  def new
  end

  def create
  	usuario = Usuario.find_by(email: params[:session][:email].downcase)
    if usuario && usuario.authenticate(params[:session][:password])
      iniciar_sesion(usuario)
      redirect_to "/home/index"

    else
      render 'new'
    end
  end

  def destroy
    salir
    redirect_to root_url
  end
end
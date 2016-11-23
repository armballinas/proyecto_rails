class HomeController < ApplicationController
  before_action :usuario_iniciado, only: [:lista_comentarios]
  before_action :usuario_admin, only: [:lista_comentarios]
  def index
    @eventos = Evento.all
  end

  def contacto
  end

  def quienes_somos
  end

  def crear_contacto
  	if request.post?
  		nombre = (params[:nombre])
  		comentarios = (params[:comentarios])
  		correo = (params[:email])
  		Contacto.create(:nombre=>nombre,:comentario=>comentarios,:email=>correo)
  	end
  	redirect_to "/home/index"
  end

  def eliminar
  	Contacto.find(params[:id]).destroy
  	redirect_to "/home/lista_comentarios"
  end

  def lista_comentarios
  	@comentarios = Contacto.all
  end

  
end

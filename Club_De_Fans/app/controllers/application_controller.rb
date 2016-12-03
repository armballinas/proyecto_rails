class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  protected
  def usuario_iniciado
      unless iniciado?
        redirect_to login_url, notice: 'Por favor inicia sesión.'
      end
    end

  def usuario_correcto
    @usuario = Usuario.find(params[:id])
    redirect_to(root_url) unless @usuario == usuario_actual
  end

  def usuario_admin
    not_found unless es_admin?
  end

  def not_found
    render :file => "#{Rails.root}/public/500", :layout => false
  end
end

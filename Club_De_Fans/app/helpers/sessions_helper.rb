module SessionsHelper


  def iniciar_sesion(usuario)
    session[:usuario_id] = usuario.id
  end

  def usuario_actual
    @usuario_actual ||= Usuario.find_by(id: session[:usuario_id])
  end

  def iniciado?
    !usuario_actual.nil?
  end

  def salir
    session.delete(:usuario_id)
    @usuario_actual = nil
  end

  def es_usuario_actual?(usuario)
    usuario == usuario_actual
  end

  def es_admin?
    if usuario_actual != nil
      usuario_actual.tipo?
    else
      false
    end
  end

end
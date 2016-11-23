json.extract! usuario, :id, :nombre, :email, :password_digest, :tipo, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
json.extract! evento, :id, :nombre, :descripcion, :fecha, :created_at, :updated_at
json.url evento_url(evento, format: :json)
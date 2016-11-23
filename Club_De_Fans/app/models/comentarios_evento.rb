class ComentariosEvento < ActiveRecord::Base
	validates :comentario, presence: true, length: {minimum: 1}
end

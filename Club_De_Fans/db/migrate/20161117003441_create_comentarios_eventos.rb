class CreateComentariosEventos < ActiveRecord::Migration
  def change
    create_table :comentarios_eventos do |t|
      t.integer :id_evento
      t.text :comentario

      t.timestamps null: false
    end
  end
end

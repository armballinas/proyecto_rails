class CreateImagenNombres < ActiveRecord::Migration
  def change
    create_table :imagen_nombres do |t|
      t.integer :id_evento
      t.string :nombre_imagen

      t.timestamps null: false
    end
  end
end

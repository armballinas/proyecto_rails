class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.string :nombre
      t.text :comentario
      t.string :email

      t.timestamps null: false
    end
  end
end

class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :nombre
      t.string :email
      t.string :password_digest
      t.boolean :tipo

      t.timestamps null: false
    end
  end
end

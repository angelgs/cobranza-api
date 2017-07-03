class CreatePersonas < ActiveRecord::Migration[5.1]
  def change
    create_table :personas do |t|
      t.string :clave, limit: 15
      t.string :type
      t.string :primer_nombre, limit: 50
      t.string :segundo_nombre, limit: 50
      t.string :apellido_paterno, limit: 50
      t.string :apellido_materno, limit: 50
      t.string :curp, limit: 17
      t.string :rfc, limit: 13

      t.timestamps
    end
    add_index :personas, :clave
  end
end

class CreateCobradors < ActiveRecord::Migration[5.1]
  def change
    create_table :cobradors do |t|
      t.string :clave, limit: 15
      t.string :nombre, limit: 80
      t.string :zona, limit: 25
      t.string :ruta, limit: 10

      t.timestamps
    end
    add_index :cobradors, :clave, unique: true
  end
end

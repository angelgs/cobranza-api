class CreateDireccions < ActiveRecord::Migration[5.1]
  def change
    create_table :direccions do |t|
      t.string :calle, limit: 80
      t.string :numero_exterior, limit: 10
      t.string :numero_interior, limit: 10
      t.string :colonia, limit: 60
      t.string :municipio, limit: 60
      t.string :estado, limit: 60
      t.string :pais, limit: 60
      t.text :referencias
      t.references :persona, foreign_key: true

      t.timestamps
    end
  end
end

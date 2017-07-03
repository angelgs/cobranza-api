class CreateTelefonos < ActiveRecord::Migration[5.1]
  def change
    create_table :telefonos do |t|
      t.references :persona, foreign_key: true
      t.string :numero_telefono, limit: 15
      t.integer :tipo_telefono
      t.string :alias, limit: 30

      t.timestamps
    end
  end
end

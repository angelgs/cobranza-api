class CreateProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :productos do |t|
      t.references :contrato, foreign_key: true
      t.integer :cantidad
      t.string :descripcion, limit: 50
      t.decimal :precio_unitario, precision: 12, scale: 2
      t.decimal :precio_venta, precision: 15, scale: 2

      t.timestamps
    end
  end
end

class CreatePagos < ActiveRecord::Migration[5.1]
  def change
    create_table :pagos do |t|
      t.references :contrato, foreign_key: true
      t.datetime :fecha_pago
      t.integer :numero_pago
      t.decimal :monto_pago, :precision => 12, :scale => 2

      t.timestamps
    end
    add_index :pagos, :fecha_pago
  end
end

class CreateContratos < ActiveRecord::Migration[5.1]
  def change
    create_table :contratos do |t|
      t.string :numero_contrato, limit: 15
      t.string :numero_cuenta, limit: 15
      t.date :fecha_apertura
      t.decimal :monto_contrato, :precision => 12, :scale => 2 
      t.decimal :saldo, :precision => 12, :scale => 2
      t.integer :total_pagos
      t.integer :pagos_atrasados
      t.decimal :cargo_intereses, :precision => 12, :scale => 2
      t.decimal :otros_cargos, :precision => 12, :scale => 2
      t.string :motivo_otros_cargos, limit: 60
      t.text :aviso

      t.timestamps
    end
    add_index :contratos, :numero_contrato, unique: true
    add_index :contratos, :numero_cuenta, unique: true
    add_index :contratos, :fecha_apertura
  end
end

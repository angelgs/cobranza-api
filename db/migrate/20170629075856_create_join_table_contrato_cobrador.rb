class CreateJoinTableContratoCobrador < ActiveRecord::Migration[5.1]
  def change
    create_join_table :contratos, :cobradors do |t|
      t.index [:contrato_id, :cobrador_id]
      t.index [:cobrador_id, :contrato_id]
    end
  end
end

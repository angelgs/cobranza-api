class CreateJoinTableCobradorPago < ActiveRecord::Migration[5.1]
  def change
    create_join_table :cobradors, :pagos do |t|
      # t.index [:cobrador_id, :pago_id]
      # t.index [:pago_id, :cobrador_id]
    end
  end
end

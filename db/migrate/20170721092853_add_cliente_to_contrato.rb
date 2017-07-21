class AddClienteToContrato < ActiveRecord::Migration[5.1]
  def change
    add_reference :contratos, :cliente, foreign_key: { to_table: :personas }
  end
end

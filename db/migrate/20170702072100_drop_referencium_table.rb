class DropReferenciumTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :link_cliente_referencia
  end
end

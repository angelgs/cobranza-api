class CreateLinkClienteReferencia < ActiveRecord::Migration[5.1]
  def change
    create_table :link_cliente_referencia do |t|
      t.references :cliente, references: :personas
      t.references :referencium, references: :personas

      t.timestamps
    end
  end
end

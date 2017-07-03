class AddAvalToPersona < ActiveRecord::Migration[5.1]
  def change
    add_column :personas, :es_aval, :boolean
  end
end

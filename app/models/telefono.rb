class Telefono < ApplicationRecord
  enum tipo_telefono: [:casa, :oficina, :celular]
  belongs_to :persona

end

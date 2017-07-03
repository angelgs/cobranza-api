class Producto < ApplicationRecord
  belongs_to :contrato
  validates_presence_of :cantidad, :descripcion, :precio_venta
end

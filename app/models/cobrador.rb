class Cobrador < ApplicationRecord
  has_and_belongs_to_many :contratos
  has_and_belongs_to_many :pagos

  validates_presence_of :clave, :nombre, :zona, :ruta
end

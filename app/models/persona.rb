class Persona < ApplicationRecord
  has_one :direccion
  has_many :telefonos

  validates_presence_of :type, :primer_nombre, :apellido_paterno
end

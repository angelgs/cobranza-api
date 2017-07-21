class CobradorSerializer < ActiveModel::Serializer
  attributes :id, :clave, :nombre, :zona, :ruta

  has_many :contratos
end

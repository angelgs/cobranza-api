class ClienteSerializer < ActiveModel::Serializer
  attributes :id, :clave, :nombre_completo, :curp, :rfc
  has_one :direccion
  has_many :telefonos
  has_many :referencias, serializer: ReferenciumSerializer
  has_many :contratos

  def nombre_completo
    "#{ object.primer_nombre } #{ object.segundo_nombre } #{ object.apellido_paterno } #{ object.apellido_materno }"
  end

end

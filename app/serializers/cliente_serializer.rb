class ClienteSerializer < ActiveModel::Serializer
  attributes :id, :clave, :nombre_completo, :curp, :rfc, :direccion, :telefonos, :referencias, :type
  #has_one :direccion
  #has_many :telefonos
  #has_many :referencias, serializer: ReferenciumSerializer
  #has_many :contratos

  def telefonos
    ActiveModelSerializers::SerializableResource.new(object.telefonos, each_serializer: TelefonoSerializer).as_json
  end

  def referencias
    ActiveModelSerializers::SerializableResource.new(object.referencias, each_serializer: ReferenciumSerializer).as_json
  end

  def nombre_completo
    "#{ object.primer_nombre } #{ object.segundo_nombre } #{ object.apellido_paterno } #{ object.apellido_materno }"
  end

  def direccion
    "#{object.direccion.calle} #{object.direccion.numero_exterior} - #{object.direccion.numero_interior}, #{object.direccion.colonia}, #{object.direccion.municipio}, #{object.direccion.estado}"
  end

end

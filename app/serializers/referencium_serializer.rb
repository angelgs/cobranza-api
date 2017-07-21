class ReferenciumSerializer < ActiveModel::Serializer

  def nombre_completo
    "#{object.primer_nombre} #{ object.segundo_nombre} #{object.apellido_paterno} #{object.apellido_materno}"
  end

  def direccion
    "#{object.direccion.calle} #{object.direccion.numero_exterior} - #{object.direccion.numero_interior}, #{object.direccion.colonia}, #{object.direccion.municipio}, #{object.direccion.estado}"
  end

=begin
  def domicilio
    DireccionSerializer.new(object.direccion).attributes
  end
=end
  def telefonos
    ActiveModelSerializers::SerializableResource.new(object.telefonos, each_serializer: TelefonoSerializer).as_json
  end

  attributes :id, :nombre_completo, :direccion, :es_aval, :telefonos, :type
end

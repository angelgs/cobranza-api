class ReferenciumSerializer < ActiveModel::Serializer

  def nombre_completo
    "#{object.primer_nombre} #{ object.segundo_nombre} #{object.apellido_paterno} #{object.apellido_materno}"
  end

  def domicilio
    DireccionSerializer.new(object.direccion).attributes
  end

  def telefonos
    ActiveModelSerializers::SerializableResource.new(object.telefonos, each_serializer: TelefonoSerializer).as_json
  end

  attributes :id, :nombre_completo, :domicilio, :es_aval, :telefonos
end

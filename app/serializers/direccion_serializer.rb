class DireccionSerializer < ActiveModel::Serializer
  def domicilio
    "#{object.calle} #{object.numero_exterior} - #{object.numero_interior}, #{object.colonia}, #{object.municipio}, #{object.estado}"
  end

  attributes :id, :domicilio

  belongs_to :persona, class_name: "Persona"
end

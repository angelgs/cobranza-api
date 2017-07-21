class TelefonoSerializer < ActiveModel::Serializer
  attributes :id, :numero_telefono, :tipo_telefono, :alias

  #has_one :persona
end

class TelefonoSerializer < ActiveModel::Serializer
  attributes :id, :numero_telefono, :tipo_telefono

  #has_one :persona
end

class ContratoSerializer < ActiveModel::Serializer

  def articulos
    ActiveModelSerializers::SerializableResource.new(object.productos, each_serializer: ProductoSerializer).as_json
  end

  attributes :id, :numero_contrato, :numero_cuenta, :fecha_apertura, :monto_contrato,
    :saldo, :total_pagos, :pagos_atrasados, :cargo_intereses, :otros_cargos,
    :motivo_otros_cargos, :aviso, :articulos

  belongs_to :cliente
end

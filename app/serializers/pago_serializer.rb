class PagoSerializer < ActiveModel::Serializer
  attributes :contrato_id, :numero_pago, :fecha_pago, :monto_pago
end

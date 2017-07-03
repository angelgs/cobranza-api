class Pago < ApplicationRecord
  belongs_to :contrato
  has_and_belongs_to_many :cobradors

  validates_presence_of :fecha_pago, :monto_pago, :numero_pago
end

class ContratoSerializer < ActiveModel::Serializer
  attributes :id, :numero_contrato, :numero_cuenta, :fecha_apertura, :monto_contrato, :saldo, :total_pagos, :productos

  belongs_to :cliente
  has_many :productos
end

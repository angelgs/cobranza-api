class Contrato < ApplicationRecord
  belongs_to :cliente
  has_many :pagos
  has_many :productos
  has_and_belongs_to_many :cobradors

  validates_presence_of :numero_contrato, :numero_cuenta, :fecha_apertura, :monto_contrato, :saldo, :total_pagos
end

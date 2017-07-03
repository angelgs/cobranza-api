require 'rails_helper'

RSpec.describe Contrato, type: :model do
  it { should belong_to(:cliente) }
  it { should have_many(:productos) }
  it { should have_many(:pagos) }
  it { should have_and_belong_to_many(:cobradors) }

  it { should validate_presence_of(:numero_contrato)}
  it { should validate_presence_of(:numero_cuenta)}
  it { should validate_presence_of(:fecha_apertura)}
  it { should validate_presence_of(:monto_contrato)}
  it { should validate_presence_of(:saldo)}
  it { should validate_presence_of(:total_pagos)}

end

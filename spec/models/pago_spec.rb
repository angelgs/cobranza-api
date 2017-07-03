require 'rails_helper'

RSpec.describe Pago, type: :model do
  it { should belong_to(:contrato) }
  it { should have_and_belong_to_many(:cobradors) }

  it { should validate_presence_of(:fecha_pago)}
  it { should validate_presence_of(:monto_pago)}
  it { should validate_presence_of(:numero_pago)}

end

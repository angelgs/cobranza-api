require 'rails_helper'

RSpec.describe Cliente, type: :model do
  it { should have_many(:contratos)}
  it { should have_one(:direccion) }
  it { should have_many(:telefonos) }
  it { should have_many(:referencias)}

  it { should validate_presence_of(:type)}
end

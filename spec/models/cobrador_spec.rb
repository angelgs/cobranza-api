require 'rails_helper'

RSpec.describe Cobrador, type: :model do
  it { should have_and_belong_to_many(:contratos) }
  it { should have_and_belong_to_many(:pagos) }

  it { should validate_presence_of(:clave)}
  it { should validate_presence_of(:nombre)}
  it { should validate_presence_of(:zona)}
  it { should validate_presence_of(:ruta)}
end

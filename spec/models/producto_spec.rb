require 'rails_helper'

RSpec.describe Producto, type: :model do
  it { should belong_to(:contrato) }
  it { should validate_presence_of(:cantidad)}
  it { should validate_presence_of(:descripcion)}
  it { should validate_presence_of(:precio_venta)}
end

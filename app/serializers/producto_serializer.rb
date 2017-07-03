class ProductoSerializer < ActiveModel::Serializer
  attributes :id, :cantidad, :descripcion, :precio_venta
end

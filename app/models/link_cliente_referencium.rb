class LinkClienteReferencium < ApplicationRecord
  belongs_to :cliente, class_name: "Persona", foreign_key: "cliente_id"
  belongs_to :referencium, class_name: "Persona", foreign_key: "referencium_id"
end


class Cliente < Persona
  has_many :linkClienteReferencia
  has_many :referencias, through: :linkClienteReferencia, source: :referencium

  has_many :persona_referencias, foreign_key: :referencium_id, class_name: 'LinkClienteReferencium'
  has_many :referenciados, through: :persona_referencias, source: :cliente

  has_many :contratos
end

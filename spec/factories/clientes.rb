FactoryGirl.define do

  factory :producto do
    cantidad { Faker::Number.digit }
    descripcion { Faker::Commerce.product_name }
    precio_venta { Faker::Commerce.price }
    contrato
  end

  factory :contrato do
    cliente
    numero_contrato { Faker::Bank.swift_bic }
    numero_cuenta { Faker::Company.ein }
    fecha_apertura { Faker::Date.between(2.days.ago, Date.today) }
    monto_contrato { Faker::Number.decimal(2) }
    saldo { Faker::Number.decimal(2) }
    total_pagos { Faker::Number.digit }
    pagos_atrasados { Faker::Number.digit }
    cargo_intereses { Faker::Number.decimal(2) }
    otros_cargos { Faker::Number.decimal(2) }
    motivo_otros_cargos { Faker::Lorem.sentence }
    aviso { Faker::Commerce.promotion_code }

    factory :contrato_with_productos do
      transient do
        productos_count 3
      end

      after(:create) do |contrato, evaluator|
        create_list(:producto, evaluator.productos_count, contrato: contrato)
      end
    end

  end

  factory :direccion do
    persona
    calle { Faker::Address.street_name }
    numero_exterior { Faker::Address.building_number }
    colonia { Faker::Address.city }
    municipio { Faker::Address.city }
    estado { Faker::Address.state }
    pais { Faker::Address.country }
  end

  factory :telefono do
    persona
    numero_telefono { Faker::PhoneNumber.phone_number }
    tipo_telefono { Faker::Number.between(1, 3) }
#    'alias' { Faker::Lorem.word }
  end

  factory :persona do
    primer_nombre { Faker::Name.first_name }
    apellido_paterno {Faker::Name.last_name}
  end

  factory :referencium, parent: :persona do
    type "Referencium"
    es_aval { Faker::Boolean.boolean }
  end

  factory :cliente, parent: :persona do
    type "Cliente"

    factory :cliente_with_contratos do
      transient do
        contratos_count 2
      end

      after(:create) do |cliente, evaluator|
        create_list(:contrato, evaluator.contratos_count, cliente: cliente)
      end
    end

    factory :cliente_with_referencias do
      transient do
        referencias_count 2
      end

      after(:create) do |cliente, evaluator|
        create_list(:referencium, evaluator.referencias_count, cliente: cliente)
      end
    end

  end

end

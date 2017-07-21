# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

LinkClienteReferencium.destroy_all
Direccion.destroy_all
Telefono.destroy_all
Referencium.destroy_all
Pago.destroy_all
Producto.destroy_all
Contrato.destroy_all
Cliente.destroy_all
Cobrador.destroy_all

cobradores = Array.new(2)
2.times do |index_cobrador|
  cobrador = Cobrador.create(clave: Faker::Lorem.characters(15),
  nombre: Faker::Name.name,
  zona: Faker::Lorem.characters(25),
  ruta: Faker::Lorem.characters(10))
  cobradores[index_cobrador - 1] =  cobrador.id
end

5.times do |index|
  cliente = Cliente.create(clave: Faker::Lorem.characters(15),
  primer_nombre: Faker::Name.first_name,
  apellido_paterno: Faker::Name.last_name,
  curp: Faker::Lorem.characters(17),
  rfc: Faker::Lorem.characters(13))

  if cliente.errors.blank?

    Direccion.create(persona: cliente,
        calle: Faker::Address.street_name,
        numero_exterior: Faker::Address.building_number,
        colonia: Faker::Address.city,
        municipio: Faker::Address.city,
        estado: Faker::Address.state,
        pais: Faker::Address.country)

    2.times do |index_telefono|
      cliente.telefonos.create(numero_telefono: Faker::PhoneNumber.phone_number,
        tipo_telefono: Faker::Number.between(0, 2))
    end

    2.times do |index_referencia|
      referencia = Referencium.create(primer_nombre: Faker::Name.first_name,
      apellido_paterno: Faker::Name.last_name, es_aval: Faker::Boolean.boolean)

      if referencia.errors.blank?
        Direccion.create(persona: referencia,
            calle: Faker::Address.street_name,
            numero_exterior: Faker::Address.building_number,
            colonia: Faker::Address.city,
            municipio: Faker::Address.city,
            estado: Faker::Address.state,
            pais: Faker::Address.country)

        2.times do |index_telefono|
          referencia.telefonos.create(numero_telefono: Faker::PhoneNumber.phone_number,
            tipo_telefono: Faker::Number.between(0, 2))
        end

        cliente.referencias << referencia
      end
    end

    2.times do |index_contrato|
      contrato = Contrato.create(cliente: cliente,
          numero_contrato: Faker::Number.number(15),
          numero_cuenta: Faker::Number.number(15),
          fecha_apertura: Faker::Date.between(2.days.ago, Date.today),
          monto_contrato: Faker::Number.decimal(2),
          saldo: Faker::Number.decimal(2),
          total_pagos: Faker::Number.between(6, 48),
          pagos_atrasados: Faker::Number.digit,
          cargo_intereses: Faker::Number.decimal(2),
          otros_cargos: Faker::Number.decimal(2),
          motivo_otros_cargos: Faker::Lorem.sentence,
          aviso: Faker::Lorem.paragraph)

      if contrato.errors.blank?

        3.times do |index_productos|
          contrato.productos.create(cantidad: Faker::Number.between(1, 3),
              descripcion: Faker::Commerce.product_name,
              precio_unitario: Faker::Commerce.price,
              precio_venta: Faker::Commerce.price)
        end

        cobrador = Cobrador.find(cobradores[Faker::Number.between(0, 1)])
        cobrador.contratos << contrato

        3.times do |index_pagos|
          pago = contrato.pagos.create(fecha_pago: Faker::Date.between(365.days.ago, Date.today),
           numero_pago: Faker::Number.between(1, 48),
            monto_pago: Faker::Number.decimal(2))
          cobrador.pagos << pago
        end

      end
    end
  end
end

p "Created #{Cliente.count} clientes"

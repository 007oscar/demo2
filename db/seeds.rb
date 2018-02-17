# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
puts "empezando"

CSV.foreach("victor.csv", headers: true) do |linea|
  print linea
  puts ""

#actualizacion oscar

  folio = linea[1].split('/')[0]
  a_folio = linea[1].split('/')[1]
  anexos_r = "NINGUNO"
  anexos_e = "NINGUNO"
  fecha_r = linea[4]
  fecha_e = linea[8]
  observaciones = "NINGUNA"
  ciudad = City.find_or_create_by(ciudad:linea[2]) #
  ciudad.update(estado: linea[3])

  autoridad = Authority.find_or_create_by(nombre: linea[10])
  autoridad.update(puesto: linea[11]) #

  experto = Expert.find_or_create_by(nombre: "ING. VICTOR ESTEBAN VARELA VILLARREAL")
  if linea[7] == "D"
    r= "DICTAMEN"
  elsif linea[7]== "R"
    r= "REQUERIMIENTO"
  elsif linea[7] == "I"
    r = "INFORME"
  else
    r="NOTIFICACION"
  end

  resultado = Result.find_or_create_by(resultado: r)
  expediente = Expedient.find_or_create_by(expediente: linea[5]) #

  if linea[6] == 'N'
    detenido = false
  else
    detenido = true
  end

#actualizacion libro anterior
#
  # folio = linea[0].split('/')[0]
  # a_folio = linea[0].split('/')[1]
  # anexos_r = linea[4]
  # anexos_e = linea[9]
  # fecha_r = linea[5]
  # fecha_e = linea[7]
  # observaciones = linea[10]
  # ciudad = City.find_or_create_by(ciudad:linea[2].split(',')[0]) #.update(estado: linea[2].split(',')[1]) #
  # autoridad = Authority.find_or_create_by(nombre: linea[3]) #
  # experto = Expert.find_or_create_by(nombre: linea[6])
  # resultado = Result.find_or_create_by(resultado: linea[8])
  # expediente = Expedient.find_or_create_by(expediente: linea[1]) #

  reg = Registry.new(folio:folio,year_folio:a_folio,detenido:detenido,city_id:ciudad.id,authority_id:autoridad.id, \
                     fecha_recepcion:fecha_r,fecha_entrega:fecha_e,expert_ids: [experto.id],result_id:resultado.id, \
                     expedient_id: expediente.id, anexos_recibidos: anexos_r, anexos_entregados: anexos_e)

  if reg.save
    puts "ok"
  else
    puts reg.errors.inspect
  end
end
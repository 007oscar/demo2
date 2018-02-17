#archivo = open("FOLIOS IT.csv")
require 'csv'
CSV.foreach("FOLIOS IT.csv", headers: true) do |linea|
  puts linea
  ciudad = City.find_or_create_by_estado(linea[2])
  autoridad = Authority.find_or_create_by_nombre("LIC. PRUEBA")
  experto = Expert.find_or_create_by_nombre("ING. VICTOR ESTEBAN VARELA VILLARREAL")
  resultado = Result.find_or_create_by_resultado("DICTAMEN")
  Registry.create(folio:linea[1],year_folio:2016,detenido:false,city_id:ciudad.id,authority_id:autoridad.id,fecha_recepcion:linea[3],experts_ids: ["", experto.id],result_id:resultado.id)
end
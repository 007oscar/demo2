class ReportsController < ApplicationController
  # before_action :set_report

  def estadistica1
    @experts = Expert.all
  end
  def estadistica
    consulta = Registry.where("perito_propuesto = ? and resultado is not ?", params[:perito], "NOTIFICACION")
    if params[:tipo_estadistica] == "mensual"
      @print = {
          "MPF" => {
              "DICTAMENES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "MPF", "DICTAMEN", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "INFORMES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "MPF", "INFORME", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "REQUERIMIENTOS" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "MPF", "REQUERIMIENTO", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "PETICIONES" => consulta.where("tipo_de_autoridad = ? and fecha_de_recepcion between ? and ?", \
                                "MPF", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count},
          "PFM" => {
              "DICTAMENES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "PFM", "DICTAMEN", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "INFORMES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "PFM", "INFORME", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "REQUERIMIENTOS" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "PFM", "REQUERIMIENTO", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "PETICIONES" => consulta.where("tipo_de_autoridad = ? and fecha_de_recepcion between ? and ?", \
                                "PFM", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count},
          "JDOS" => {
              "DICTAMENES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "JDOS", "DICTAMEN", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "INFORMES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "JDOS", "INFORME", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "REQUERIMIENTOS" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "JDOS", "REQUERIMIENTO", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "PETICIONES" => consulta.where("tipo_de_autoridad = ? and fecha_de_recepcion between ? and ?", \
                                "JDOS", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count},
          "POL. FED." => {
              "DICTAMENES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "POL. FED.", "DICTAMEN", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "INFORMES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "POL. FED.", "INFORME", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "REQUERIMIENTOS" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "POL. FED.", "REQUERIMIENTO", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "PETICIONES" => consulta.where("tipo_de_autoridad = ? and fecha_de_recepcion between ? and ?", \
                                  "POL. FED.", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                  Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count},
          "PGJ EDO." => {
              "DICTAMENES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "PGJ EDO.", "DICTAMEN", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "INFORMES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "PGJ EDO.", "INFORME", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "REQUERIMIENTOS" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "PGJ EDO.", "REQUERIMIENTO", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "PETICIONES" => consulta.where("tipo_de_autoridad = ? and fecha_de_recepcion between ? and ?", \
                                  "PGJ EDO.", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                  Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count},
          "OTROS" => {
              "DICTAMENES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "OTROS", "DICTAMEN", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "INFORMES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "OTROS", "INFORME", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "REQUERIMIENTOS" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "OTROS", "REQUERIMIENTO", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count,
              "PETICIONES" => consulta.where("tipo_de_autoridad = ? and fecha_de_recepcion between ? and ?", \
                                  "OTROS", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                  Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count},
          "INICIO" => consulta.where("fecha_de_recepcion < ? and fecha_de_entregado is null", \
                                  Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i)).count,
          "PERITO" => params[:perito],
          "DETENIDOS" => consulta.where("detenido = ? and fecha_de_recepcion between ? and ?", \
                                  true, Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                  Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count.to_s + \
                                  " CON DETENIDO"
      }
      book = Spreadsheet.open('mensual.xls', 'rb')
      sheet1 = book.worksheet 0
      mes = ["ENERO","FEBRERO","MARZO","ABRIL","MAYO","JUNIO","JULIO","AGOSTO","SEPTIEMBRE","OCTUBRE","NOVIEMBRE","DICIEMBRE"]
      sheet1.rows[5][13] = mes[params["fecha_m"]["m(2i)"].to_i - 1 ] + "/" + params["fecha_m"]["m(1i)"].to_s
      sheet1.rows[7][13] = Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)
      sheet1.rows[12][4] = @print["INICIO"]
      sheet1.rows[12][5] = @print["MPF"]["PETICIONES"]
      sheet1.rows[12][6] = @print["PFM"]["PETICIONES"]
      sheet1.rows[12][7] = @print["JDOS"]["PETICIONES"]
      sheet1.rows[12][8] = @print["POL. FED."]["PETICIONES"]
      sheet1.rows[12][9] = @print["PGJ EDO."]["PETICIONES"]
      sheet1.rows[12][10] = @print["OTROS"]["PETICIONES"]

      sheet1.rows[12][12] =   @print["MPF"]["DICTAMENES"] +  @print["PFM"]["DICTAMENES"] + \
                              @print["JDOS"]["DICTAMENES"] + @print["POL. FED."]["DICTAMENES"] + \
                              @print["PGJ EDO."]["DICTAMENES"] + @print["OTROS"]["DICTAMENES"]
      sheet1.rows[12][13] = @print["MPF"]["REQUERIMIENTOS"] +  @print["PFM"]["REQUERIMIENTOS"] + \
                              @print["JDOS"]["REQUERIMIENTOS"] + @print["POL. FED."]["REQUERIMIENTOS"] + \
                              @print["PGJ EDO."]["REQUERIMIENTOS"] + @print["OTROS"]["REQUERIMIENTOS"]
      sheet1.rows[12][14] = @print["MPF"]["INFORMES"] +  @print["PFM"]["INFORMES"] + \
                              @print["JDOS"]["INFORMES"] + @print["POL. FED."]["INFORMES"] + \
                              @print["PGJ EDO."]["INFORMES"] + @print["OTROS"]["INFORMES"]
      sheet1.rows[18][0] = @print["DETENIDOS"]
      sheet1.rows[22][3] = @print["PERITO"]
      book.write 'reporte_generado.xls'

    else
      @print = {
          "MPF" => {
              "DICTAMENES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "MPF", "DICTAMEN", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6 ).count,
              "INFORMES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "MPF", "INFORME", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "REQUERIMIENTOS" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "MPF", "REQUERIMIENTO", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "PETICIONES" => consulta.where("tipo_de_autoridad = ? and fecha_de_recepcion between ? and ?", \
                                "MPF", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count},
          "PFM" => {
              "DICTAMENES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "PFM", "DICTAMEN", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "INFORMES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "PFM", "INFORME", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "REQUERIMIENTOS" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "PFM", "REQUERIMIENTO", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "PETICIONES" => consulta.where("tipo_de_autoridad = ? and fecha_de_recepcion between ? and ?", \
                                "PFM", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count},
          "JDOS" => {
              "DICTAMENES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "JDOS", "DICTAMEN", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "INFORMES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "JDOS", "INFORME", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "REQUERIMIENTOS" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "JDOS", "REQUERIMIENTO", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "PETICIONES" => consulta.where("tipo_de_autoridad = ? and fecha_de_recepcion between ? and ?", \
                                "JDOS", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count},
          "POL. FED." => {
              "DICTAMENES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "POL. FED.", "DICTAMEN", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "INFORMES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "POL. FED.", "INFORME", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "REQUERIMIENTOS" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "POL. FED.", "REQUERIMIENTO", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "PETICIONES" => consulta.where("tipo_de_autoridad = ? and fecha_de_recepcion between ? and ?", \
                                  "POL. FED.", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                  Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count},
          "PGJ EDO." => {
              "DICTAMENES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "PGJ EDO.", "DICTAMEN", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "INFORMES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "PGJ EDO.", "INFORME", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "REQUERIMIENTOS" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "PGJ EDO.", "REQUERIMIENTO", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "PETICIONES" => consulta.where("tipo_de_autoridad = ? and fecha_de_recepcion between ? and ?", \
                                  "PGJ EDO.", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                  Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count},
          "OTROS" => {
              "DICTAMENES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "OTROS", "DICTAMEN", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "INFORMES" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "OTROS", "INFORME", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "REQUERIMIENTOS" => consulta.where("tipo_de_autoridad = ? and resultado = ? and fecha_de_recepcion between ? and ?", \
                                "OTROS", "REQUERIMIENTO", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count,
              "PETICIONES" => consulta.where("tipo_de_autoridad = ? and fecha_de_recepcion between ? and ?", \
                                  "OTROS", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i), \
                                  Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).count},
          "INICIO" => consulta.where("fecha_de_recepcion < ? and fecha_de_entregado is null", \
                                  Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i)).count,
          "PERITO" => params[:perito],
          "DETENIDOS" => consulta.where("detenido = ? and fecha_de_recepcion between ? and ?", \
                                  true, Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                  Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count.to_s + \
                                  " CON DETENIDO"
      }

      book = Spreadsheet.open('semanal.xls', 'rb')
      sheet1 = book.worksheet 0
      # mes = ["ENERO","FEBRERO","MARZO","ABRIL","MAYO","JUNIO","JULIO","AGOSTO","SEPTIEMBRE","OCTUBRE","NOVIEMBRE","DICIEMBRE"]
      sheet1.rows[5][13] = Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i).to_s + \
                           "-" + (Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).to_s

      sheet1.rows[7][13] = (Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) + 6).to_s

      # sheet1.rows[12][4] = @print["INICIO"]
      sheet1.rows[12][4] = @print["MPF"]["PETICIONES"]
      sheet1.rows[12][5] = @print["PFM"]["PETICIONES"]
      sheet1.rows[12][6] = @print["JDOS"]["PETICIONES"]
      sheet1.rows[12][7] = @print["POL. FED."]["PETICIONES"]
      sheet1.rows[12][8] = @print["PGJ EDO."]["PETICIONES"]
      sheet1.rows[12][9] = @print["OTROS"]["PETICIONES"]

      sheet1.rows[12][11] =   @print["MPF"]["DICTAMENES"] +  @print["PFM"]["DICTAMENES"] + \
                              @print["JDOS"]["DICTAMENES"] + @print["POL. FED."]["DICTAMENES"] + \
                              @print["PGJ EDO."]["DICTAMENES"] + @print["OTROS"]["DICTAMENES"]
      sheet1.rows[12][12] = @print["MPF"]["REQUERIMIENTOS"] +  @print["PFM"]["REQUERIMIENTOS"] + \
                              @print["JDOS"]["REQUERIMIENTOS"] + @print["POL. FED."]["REQUERIMIENTOS"] + \
                              @print["PGJ EDO."]["REQUERIMIENTOS"] + @print["OTROS"]["REQUERIMIENTOS"]
      sheet1.rows[12][13] = @print["MPF"]["INFORMES"] +  @print["PFM"]["INFORMES"] + \
                              @print["JDOS"]["INFORMES"] + @print["POL. FED."]["INFORMES"] + \
                              @print["PGJ EDO."]["INFORMES"] + @print["OTROS"]["INFORMES"]
      sheet1.rows[18][0] = @print["DETENIDOS"]
      sheet1.rows[22][3] = @print["PERITO"]

      book.write 'reporte_generado.xls'
    end
  end


  def validacion
  end

  def verificacion
  end

  def bitacora
  end

  def caractula1
  end

  def caractula2
  end

  def report_params
    params.require(:report).permit!
  end
end

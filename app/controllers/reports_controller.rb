class ReportsController < ApplicationController
  # before_action :set_report

  def estadistica1
    @experts = Expert.all
  end

  def reporte
    send_file Rails.root.join('reporte_generado.xls'), :type => "application/xls", :x_sendfile => true
  end

  def estadistica
     if params[:tipo_estadistica] == "mensual"
       @print = Hash["MPF", mensual_total("MPF" ), "PFM", mensual_total("PFM"), "JDOS", mensual_total("JDOS"), \
                     "POL. FED.", mensual_total("POL. FED."), "PGJ EDO." , mensual_total("PGJ EDO."), \
                     "OTROS", mensual_total("OTROS"), \
          "INICIO", Registry.joins(:experts).where("expert_id = ? and fecha_recepcion < ? and fecha_entrega is null", \
                                  params[:perito], Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i)).count,
          "PERITO", Expert.find(params[:perito]).nombre,
          "DETENIDOS", Registry.where("detenido = ? and fecha_recepcion between ? and ?", \
                                  true, Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                  Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count.to_s + \
                                  " CON DETENIDO"]
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
      sheet1.rows[12][1] = @print["PERITO"]
      book.write 'reporte_generado.xls'

    else
      @print = Hash[ "MPF", semanal_total("MPF" ), "PFM", semanal_total("PFM"), \
                     "JDOS", semanal_total("JDOS"),"POL. FED.",  semanal_total("POL. FED."), \
                     "PGJ EDO.",  semanal_total("PGJ EDO."), "OTROS", semanal_total("OTROS"), \
          "INICIO", Registry.joins(:experts).where("expert_id = ? and fecha_recepcion < ? and fecha_entrega is null", \
                                  params[:perito], Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i)).count,
          "PERITO", Expert.find(params[:perito]).nombre,
          "DETENIDOS",Registry.where("detenido = ? and fecha_recepcion between ? and ?", \
                                  true, Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) - 6, \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i)).count.to_s + \
                                  " CON DETENIDO"]
      book = Spreadsheet.open('semanal.xls', 'rb')
      sheet1 = book.worksheet 0
      # mes = ["ENERO","FEBRERO","MARZO","ABRIL","MAYO","JUNIO","JULIO","AGOSTO","SEPTIEMBRE","OCTUBRE","NOVIEMBRE","DICIEMBRE"]
      sheet1.rows[5][12] = (Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) - 6).to_s + \
                           "-" + Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i).to_s

      sheet1.rows[7][12] = (Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i)).to_s

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
      sheet1.rows[12][1] = @print["PERITO"]

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

  def semanal_total(autoridad)
    Hash["DICTAMENES" => semanal_productos(autoridad, "DICTAMEN"),
      "INFORMES" => semanal_productos(autoridad, "INFORME"),
      "REQUERIMIENTOS" => semanal_productos(autoridad, "REQUERIMIENTO"),
      "PETICIONES" => semanal_peticiones(autoridad)]
  end

  def semanal_productos(autoridad, producto)
    Registry.joins(:authority, :result).where("puesto = ? and resultado = ? and fecha_recepcion between ? and ?", \
                                autoridad, producto, Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) - 6, \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i)).count
  end

  def semanal_peticiones(autoridad)
    Registry.joins(:authority, :result).where("puesto = ? and resultado is not ? and fecha_recepcion between ? and ?", \
                                autoridad, "NOTIFICACION", Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i) - 6, \
                                Date.civil(params["fecha_s"]["s(1i)"].to_i, params["fecha_s"]["s(2i)"].to_i, params["fecha_s"]["s(3i)"].to_i)).count
  end

  def mensual_productos(autoridad, producto)
    Registry.joins(:authority, :result).where("puesto = ? and resultado = ? and fecha_recepcion between ? and ?", \
                                autoridad, producto, Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count
  end

  def mensual_peticiones(autoridad)
    Registry.joins(:authority, :result).where("puesto = ? and resultado is not ? and fecha_recepcion between ? and ?", \
                                autoridad, "NOTIFICACION", Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i), \
                                Date.civil(params["fecha_m"]["m(1i)"].to_i, params["fecha_m"]["m(2i)"].to_i, -1)).count
  end

  def mensual_total(autoridad)
    Hash["DICTAMENES" => mensual_productos(autoridad, "DICTAMEN"),
                   "INFORMES" => mensual_productos(autoridad, "INFORME"),
                   "REQUERIMIENTOS" => mensual_productos(autoridad, "REQUERIMIENTO"),
                   "PETICIONES" => mensual_peticiones(autoridad)]
  end

  def report_params
    params.require(:report).permit!
  end
end

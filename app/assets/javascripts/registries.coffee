$(document).on 'turbolinks:load', ->
  $('#registry_fecha_r').datepicker({dateFormat: "dd/mm/yy"})
#  $('#registry_fecha_r').datepicker("setDate", new Date())

  $('#registry_hora_r').timepicker({})
#  $('#registry_hora_r').timepicker('setTime', new Date())

  $('#registry_fecha_e').datepicker({dateFormat: "dd/mm/yy"})
  $('#registry_hora_e').timepicker({})

#  $('#fecha_registro_recepcion').datepicker()


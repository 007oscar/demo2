$(document).on 'turbolinks:load', ->
  $('#registry_fecha_r').datepicker({dateFormat: "dd/mm/yy"})
#  $('#registry_fecha_r').datepicker("setDate", new Date())

  $('#registry_hora_r').timepicker({})
#  $('#registry_hora_r').timepicker('setTime', new Date())

  $('#registry_fecha_e').datepicker({dateFormat: "dd/mm/yy"})
  $('#registry_hora_e').timepicker({})

  $("#autoridad a.add_fields").
    data("association-insertion-position", 'before').
    data("association-insertion-node", 'this')

  $("#autoridad").on "cocoon:before-insert", ->
      $("#autoridad_lista").hide()
      $("#autoridad a.add_fields").hide()

  $("#autoridad").on "cocoon:before-remove", ->
      $("#autoridad_lista").show()
      $("#autoridad a.add_fields").show()

#  $("#registry_expedient_attributes_nombre_expediente").autocomplete source: ["hoook", "hho", "hokl"]


# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $("#verification_incluye_expediente").change ->
    if $("#verification_incluye_expediente option:selected").text() == "NO"
      resetear_select($("#verification_coincide_expediente"), "NO APLICA")
  $("#verification_incluye_anexos").change ->
    if $("#verification_incluye_anexos option:selected").text() == "NO"
      resetear_select($("#verification_coinciden_anexos"), "NO APLICA")
      resetear_select($("#verification_anexos_equipos_de_computo"), "NO APLICA")
      resetear_select($("#verification_anexos_equipo_de_comunicacion"), "NO APLICA")
      resetear_select($("#verification_anexos_material_fotografico"), "NO APLICA")
      resetear_select($("#verification_anexos_disp_alm_elect"), "NO APLICA")
      resetear_select($("#verification_anexos_componentes_electronicos"), "NO APLICA")
      resetear_select($("#verification_otros"), "NO")

resetear_select =(t, v) ->
  switch v
    when "SI" then pos = 0
    when "NO" then pos = 1
    else pos = 2
  t.find("option")[pos].selected =  true







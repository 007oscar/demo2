# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#expediente a.add_fields').data('association-insertion-position', 'before').data 'association-insertion-node', 'this'

  $('#expediente').bind 'cocoon:after-insert', ->
    $('#expediente_lista').hide()
    $('#expediente a.add_fields').hide()


  $('#expediente').bind 'cocoon:after-remove', ->
    $('#expediente_lista').show()
    $('#expediente a.add_fields').show()

  # city
  $('#ciudad a.add_fields').data('association-insertion-position', 'before').data 'association-insertion-node', 'this'

  $('#ciudad').bind 'cocoon:after-insert', ->
    $('#ciudad_lista').hide()
    $('#ciudad a.add_fields').hide()

  $('#ciudad').bind 'cocoon:after-remove', ->
    $('#ciudad_lista').show()
    $('#ciudad a.add_fields').show()

  # autoridad

#  $('#autoridad').bind 'cocoon:before-insert', ->
#  $('#autoridad_lista').toggle
  $('#autoridad a.add_fields').data('association-insertion-position', 'before').data 'association-insertion-node', 'this'

  $('#autoridad').bind 'cocoon:after-insert', ->
    $('#autoridad_lista').hide()
    $('#autoridad a.add_fields').hide()

  $('#autoridad').bind 'cocoon:after-remove', ->
    $('#autoridad_lista').show()
    $('#autoridad a.add_fields').show()

  # city

#  $('#experto').bind 'cocoon:before-insert', ->
#  $('#experto_lista').toggle
  $('#experto a.add_fields').data('association-insertion-position', 'before').data 'association-insertion-node', 'this'

  $('#experto').bind 'cocoon:after-insert', ->
    $('#experto_lista').hide()
    $('#experto a.add_fields').hide()

  $('#experto').bind 'cocoon:after-remove', ->
    $('#experto_lista').show()
    $('#experto a.add_fields').show()

  # city

#  $('#resultado').bind 'cocoon:before-insert', ->
#  $('#resultado_lista').toggle
  $('#resultado a.add_fields').data('association-insertion-position', 'before').data 'association-insertion-node', 'this'

  $('#resultado').bind 'cocoon:after-insert', ->
    $('#resultado_lista').hide()
    $('#resultado a.add_fields').hide()

  $('#resultado').bind 'cocoon:after-remove', ->
    $('#resultado_lista').show()
    $('#resultado a.add_fields').show()

  showOption = (value) ->
    $('#optionHolder option[value="' + value + '"]').appendTo '#selectID'

  hideOption = (value) ->
    $('select option[value="' + value + '"]').appendTo '#optionHolder'

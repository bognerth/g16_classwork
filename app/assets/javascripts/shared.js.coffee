$ ->
  $("input.datepicker").each (i) ->
    $(this).datepicker
      altFormat: "yy-mm-dd"
      dateFormat: "dd.mm.yy"
      altField: $(this).next()
  $('.datatable').dataTable
    "iDisplayLength": 5,
    "sPaginationType": "full_numbers" 
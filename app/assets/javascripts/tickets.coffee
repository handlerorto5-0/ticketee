$ ->
  $("#add_file").on "ajax:success", (event) ->
    data = event.detail[0] 
    $("#attachments").append $('.form-group', data)
    $(this).data "data-params", { index: $("#attachments div.file").length }

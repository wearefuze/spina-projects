set_positions = ->
  $(".project").each (i) ->
    $(this).attr "data-pos", i + 1
    return
  return

ready = ->
  console.log("Spina Projects JS Loaded")
  set_positions()
  $(".sortable").sortable()
  $(".sortable").sortable().bind "sortupdate", (e, ui) ->
    updated_order = []
    set_positions()
    $(".project").each (i) ->
      updated_order.push
        id: $(this).data("id")
        position: i + 1
      return
    $.ajax
      type: "PUT"
      url: "/admin/projects/sort"
      data: order: updated_order
    return
  return

$(document).on 'turbolinks:load', ready

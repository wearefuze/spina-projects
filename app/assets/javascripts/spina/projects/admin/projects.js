const set_positions = function() {
  $(".project").each(function(i) {
    $(this).attr("data-pos", i + 1);
  });
};

const ready = function() {
  set_positions();
  $(".sortable").sortable();
  $(".sortable")
    .sortable()
    .bind("sortupdate", function() {
      var updated_order;
      updated_order = [];
      set_positions();
      $(".project").each(function(i) {
        updated_order.push({
          id: $(this).data("id"),
          position: i + 1
        });
      });
      $.ajax({
        type: "PUT",
        url: "/admin/projects/sort",
        data: {
          order: updated_order
        }
      });
    });
};

$(document).on("turbolinks:load", ready());

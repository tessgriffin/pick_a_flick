$(function() {
  $(document).on("click", ".watched-true-user-watchlist", function(event) {
    event.preventDefault();
    var updateData = { id: $(this).data("id"), watched: $(this).data("watched") }
    $.post("/user_watchlists/update", updateData, function(railsControllerResponse) {
      alert("movie marked as 'watched'")
    });
  });

});

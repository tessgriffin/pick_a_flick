$(function() {
  var movie = $(".movie-info ul");


if ($(".omdb-page").length) {
  $.ajax( {
    url:"http://www.omdbapi.com/?t=" + $(".movie-info").data("movieTitle").replace(/\?/g,'').split(" ").join("+") + "&y=&plot=short&r=json",
    dataType: "json",
    success: function(success) {
      movie.append("<li>" + "Meta-Score: " + success.Metascore + "</li>" + "<li>" + "Rating: " + success.Rated + "</li>" + "<li>" + "Genre: " + success.Genre + "</li>")
    }
  });

  $.ajax({
    url:"http://www.omdbapi.com/?t=" + $(".movie-info").data("movieTitle").replace(/\?/g,'').split(" ").join("+") + "&y=&plot=short&r=json",
    dataType: "json",
    success: function(success){
      $("#movie-title").html(success.Title)
      $("#movie-poster").attr("src", success.Poster)
      $("#movie-description").html("<p>" + success.Plot + "</p>"
                                  + "<p>" + "Rated: " + success.Rated + "</p>"
                                  + "<p>" + "Actors: " + success.Actors + "</p>"
                                  + "<p>" + "Director: " + success.Director + "</p>"
                                  + "<p>" + "Genre: " + success.Genre + "</p>"
                                  + "<p>" + "Rated: " + success.Rated )
    }
  });

}
});

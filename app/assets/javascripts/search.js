var printMovies = function(input){
  var movies = [];
  $.each(input, function(i, movie){
    movies.push( "<li>" + "<img src='http://image.tmdb.org/t/p/w300" + movie.poster_path + "'/>" + movie.title + "-" + movie.id + " " + "<a class='btn-large waves-effect waves-light deep-orange lighten-1' href='/user'>" + movie.title + "</a>" "</li>");
  });
  $("<ul/>", {
    "id": "searched_movies",
    html: movies.join( "" )
  }).prependTo( "#searched_movies" );
};

$(function() {
  $( "#search_button" ).click(function() {
    console.log($("#search_box").val());
    var input = $("#search_box").val();
    var data = $.getJSON("http://api.themoviedb.org/3/search/multi?query=" + input + "&language=en&api_key=171eae1994f298598bb52dd4d2a6d877", function(){
    })
    .then(function(success) {
      printMovies(success.results)
    });
  })
});

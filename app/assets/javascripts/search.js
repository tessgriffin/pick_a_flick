// $(function() {
//   $("#search_button").click(function(){
//     console.log("Hello World")
//     var input = $("#search_box").val()
//     var json = $.getJSON("http://api.themoviedb.org/3/search/multi?query=" + input + "&language=en&api_key=171eae1994f298598bb52dd4d2a6d877", function(){
//     })
//     var results = $.parseJSON(json.responseText).results;
//     var movies = $.each(results, function(i, movie){
//     console.log(movie.title + "-" + movie.id + "-" + movie.overview)}
//   })
// });
var printMovies = function(input){
  var movies = [];
  $.each(input, function(i, movie){
    if(movie.poster_path === undefined || movie.poster_path === null){
      movie.poster_path = "/zh9DXJhBdHVVaWiDURTipADamcK.jpg"
    }
    if(movie.title === undefined){
      movies.push( "<div class='col lg4 search_div'><li>"
               + "<img src='http://image.tmdb.org/t/p/w300"
               + movie.poster_path 
               + "'/><br>" 
               + movie.name
               + "-" 
               + movie.id 
               + "</li></div>");
    }
    else {
      movies.push( "<div class='col lg4 search_div'><li>"
               + "<img src='http://image.tmdb.org/t/p/w300"
               + movie.poster_path 
               + "'/><br>" 
               + movie.title 
               + "-" 
               + movie.id 
               + "</li></div>");
    }
  });
  $("<ul/>", {
    "id": "searched_movies",
    html: movies.join( "" )
  }).appendTo( "#searched_movies" );
};

$(function() {
  $("#search_button").on("click", function(){
    $(".search_div").remove();
  });
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

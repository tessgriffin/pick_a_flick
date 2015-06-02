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
$(function() {
  $( "#search_button" ).click(function() {
    console.log($("#search_box").val());
    var input = $("#search_box").val();
    var json = $.getJSON("http://api.themoviedb.org/3/search/multi?query=" + input + "&language=en&api_key=171eae1994f298598bb52dd4d2a6d877", function(){
     })
    var movieResults = $.parseJSON(json.responseText).results;
//    console.log(movie_results);
  });
});

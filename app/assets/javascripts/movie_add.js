$(document).ready(function(){

  $('[data-toggle="tooltip"]').tooltip();

  $('.movie-add').click(function(){
    $(this).toggleClass("clicked");
  });
})

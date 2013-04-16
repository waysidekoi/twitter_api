$(document).ready(function(){


  $.get('/latest', function(data) {
    console.log(data);
    // $('.output').html(data);
  });
});

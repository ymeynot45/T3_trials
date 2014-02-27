$(document).ready(function() {
  //Insert js to changle the value of a clicked box to an X for the player.
  // Additionally it should change the number in the form.



  // the following should send the player move & reply with cpu move.
  $("form").on("submit", function(event){
    event.preventDefault();
    var data = $( "form" ).serialize();

    $.post('/playermove', data, function(response){
      $("#box_" + response.playermove ).css("background-color", response.playercolor).text(response.playervalue);
      $("#currentboard").val(response.currentboard);
      $("#winner").text(response.winner)
      $("#entry").val("")
    });
  });
});

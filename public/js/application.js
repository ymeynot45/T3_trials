$(document).ready(function() {

  $(".box").click(function(){
    var clickData = ($(this).text());
    $("#entry").val(clickData);
    $("form").submit();
  });

  $("form").on("submit", function(event){
    event.preventDefault();
    var data = $("form").serialize();

    $.post('/playermove', data, function(response){
      $("#message").text(response.message);
      $("#entry").val("");
      $("#box_" + response.playermove ).css("background-color", response.playercolor).text(response.playervalue);
      $("#box_" + response.cpumove ).css("background-color", response.cpucolor).text(response.cpuvalue);
      $("#currentboard").val(response.currentboard);
    });
  });
});

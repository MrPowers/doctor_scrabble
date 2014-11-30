$(document).ready(function(){

  $("#find-words").click(function() {
    var letters = $("#letters").val();
    var startWith = $("#start_with").val();
    var endWith = $("#end_with").val();
    var contains = $("#contains").val();
    $.ajax({
      url: "/fetch_words",
      type: "GET",
      data: {
        letters: letters,
        start_with: startWith,
        end_with: endWith,
        contains: contains
      },
      dataType: "json",
      success: function(data){
        $($(".search-results")).prepend("<div>" + data.join(", ") + "</div>");
      }
    });
  });

});

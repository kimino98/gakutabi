$(function () {
  $("#text_area").keyup(function(){
    var txtcount = $(this).val().length;
    $("#text_langth").text(txtcount);
    if(txtcount == 0){
      $("#text_langth").text("0");
    } 
    if(txtcount >= 135){
      $("#text_langth").css("color","#d577ab");
    } else {
      $("#text_langth").css("color","#333");
    }
  });
});

$(function () {
  $("#safety_area").keyup(function(){
    var txtcount = $(this).val().length;
    $("#safety_langth").text(txtcount);
    if(txtcount == 0){
      $("#safety_langth").text("0");
    } 
    if(txtcount >= 135){
      $("#safety_langth").css("color","#d577ab");
    } else {
      $("#safety_langth").css("color","#333");
    }
  });
});

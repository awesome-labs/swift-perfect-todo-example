$(document).ready(function(){

  $(window).keydown(function(event){
    if(event.keyCode == 13) {
      event.preventDefault();
      return false;
    }
  });

  $(".toggle").click(function(){
    var taskId = $(this).attr("data-taskid");
    var status = $(this).is(":checked") ? 1 : 0;
    console.log(status)
    $.ajax({
           url: "/done?id=" + taskId + "&status=" + status,
           type: "post",
           success: function (response) {
              console.log("task-updated")
           },
           error: function(jqXHR, textStatus, errorThrown) {
              console.log(textStatus, errorThrown);
           }
       });
  })

  $(".add").click(function(){
    var data = $(".new-task").serializeArray()
    $.ajax({
           url: "/",
           type: "post",
           data: data,
           success: function (response) {
              console.log("task-updated")
           },
           error: function(jqXHR, textStatus, errorThrown) {
              console.log(textStatus, errorThrown);
           }
       });
  })
})

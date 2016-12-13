var pageExecute = {

fileContents:"Null",
pagePrefix:"Null",
slides:"Null",

init:function () {
    $.ajax({
      url: "C:/bootstrap-3.3.7-dist/demo.txt",
      success: function (data){
            pageExecute.fileContents = data;
      }
});
}
};
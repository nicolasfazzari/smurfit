$(document).ready(function(){  

$(function(){
    $('#myModal').on('submit', function(e){
      e.preventDefault();
      $.post('.ajax/add_pdf.php', 
         $('#myForm').serialize(), 
         function(data, status, xhr){
           // do something here with response;
           $('#myModal').html(data);
         });
    });
});
   
});


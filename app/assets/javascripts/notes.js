var setup = function() {
  
  var $notes = $('#note_content');
  var $preview = $('#preview');
  
  $notes.on('input', function(event) {
    var textToTransform = $(this).val();
    
    $.ajax({
      method: "POST",
      url: "process",
      data: {text: textToTransform}
    })
      .done(function(message) {
        console.log(message);
        $preview.html(message);
      });
  });
};

$(document).on('ready page:load', setup);
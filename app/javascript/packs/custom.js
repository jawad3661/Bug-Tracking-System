$( document ).ready(function() {
  $('.status_type' ).hide();
});

var series = [
  {name: 'feature', status: 'pending'},
  {name: 'feature', status: 'started'},
  {name: 'feature', status: 'completed'},
  {name: 'bug', status: 'pending'},
  {name: 'bug', status: 'started'},
  {name: 'bug', status: 'resolved'},
]

$(".bugtype").change(function(){
  var bugtype = $('.bugtype option:selected').val();

  if (bugtype == ''){
    $('.status_type').hide();
  }
  else{
    $('.status_type').show()

  var options =  '<option value=""><strong></strong></option>';
  $(series).each(function(index, value){
    if(value.name == bugtype){
      options += '<option value="'+value.status+'">'+value.status+'</option>';
      }
    });
  }

  $('.statustype').html(options);
});

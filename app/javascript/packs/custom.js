$( document ).ready(function() {
    $( '.abc' ).hide();
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
      $('.abc').hide();
    }
    else{
      $('.abc').show()
    var options =  '<option value=""><strong></strong></option>'; //create your "title" option
    $(series).each(function(index, value){ //loop through your elements
        if(value.name == bugtype){ //check the company
            options += '<option value="'+value.status+'">'+value.status+'</option>'; //add the option element as a string
        }
    });
    }


    $('.statustype').html(options); //replace the selection's html with the new options
});

$(document).ready(function(){
  var newForm = "<div class = 'invitationForm'><p>Name: <input type='text' name='full_name[]' placeholder='John Doe'></input><br>Phone Number: <input type='text' name='phone_number[]' placeholder='xxx-xxx-xxxx'></input><br></p></div>";
  $('.addInvitation').click(function(){

    $('.invitationSet').append(newForm);//.html());
  });

  $(this).on("click","#deleteForm",function(){
    console.log("hit")
    $('.invitationForm').last().remove();
    });
});

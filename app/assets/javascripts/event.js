$(document).ready(function(){
  var newForm = $('.invitationSet').html();
  $('.addInvitation').click(function(){
    $('.invitationSet').append(newForm);
  });

  $(this).on("click","#deleteButton",function(e){
    e.preventDefault();
    $(this).parent().remove();
    });
});

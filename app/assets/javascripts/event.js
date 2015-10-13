$(document).ready(function(){
  var newForm = $('.invitationSet').html();
  $('.addInvitation').click(function(){
    $('.invitationSet').append(newForm);
  });

  $(this).on("click","#deleteForm",function(e){
    e.preventDefault();
    $(this).parent().remove();
    });
});

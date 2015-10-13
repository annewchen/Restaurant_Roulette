$(document).ready(function(){
  var newForm = $('.invitationForm').html();
  $('.addInvitation').click(function(){
    $('.invitationSet').append("<div class = 'invitationForm'>" + newForm +"</div>");
  });

  $(this).on("click","#deleteForm",function(e){
    e.preventDefault();
    $(this).parent().remove();
    });
});

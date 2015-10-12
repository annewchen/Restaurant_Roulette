$(document).ready(function(){
  $('.addInvitation').click(function(){
    $('.invitationSet').append($(".invitationForm").html());
    });

  $(this).on("click","#deleteForm",function(){
    console.log("hit")
    $('p').last().remove();
    });
});


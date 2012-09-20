
$(function(){
   var registered_or_not = $("#pec_form_registered_or_not_complaint_true, #pec_form_registered_or_not_complaint_false");

   registered_or_not.change(function(){   
      $('.registration-time:first, .give-complaint-to-higher:first').hide();
      if ($(this).val() === 'true')
      {         
         $('.registration-time:first').show();         
      }
      else
      {
         $('.give-complaint-to-higher:first').show();
      }
   });
});



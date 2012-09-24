
$(function(){

	if(gon.edit_pec_form){
		// load the date pickers
		// registration_time
		$('#pec_form_registration_time').datetimepicker({
				dateFormat: 'dd.mm.yy',
				timeFormat: 'hh:mm',
				separator: ' '
		});
		if (gon.registration_time !== undefined &&
				gon.registration_time.length > 0)
		{
			$('#pec_form_registration_time').datepicker("setDate", new Date(gon.registration_time));
		}

  }

   /*var registered_or_not = $("#pec_form_registered_or_not_complaint_true, #pec_form_registered_or_not_complaint_false");

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
   });*/
});

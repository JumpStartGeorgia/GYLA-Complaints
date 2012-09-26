$(function(){

	if(gon.edit_cec_form){
		// load the date pickers
		$("input[id*='_cesko_complaint_registration_time']").live('click', function() {
	    $(this).datetimepicker('destroy').datetimepicker({
				showOn:'focus',
				dateFormat: 'yy-mm-dd',
				timeFormat: 'hh:mm',
				separator: ' '
			}).focus();
			if ($(this).val() !== undefined && $(this).val().length > 0)
			{
				$(this).datepicker("setDate", new Date($(this).val().replace(" UTC", "")));
			}
    });

		$("input[id*='_cesko_complaint_discation_time']").live('click', function() {
	    $(this).datetimepicker('destroy').datetimepicker({
				showOn:'focus',
				dateFormat: 'yy-mm-dd',
				timeFormat: 'hh:mm',
				separator: ' '
			}).focus();
			if ($(this).val() !== undefined && $(this).val().length > 0)
			{
				$(this).datepicker("setDate", new Date($(this).val()));
			}
    });
  }

});

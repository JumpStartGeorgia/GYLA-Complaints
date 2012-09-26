$(function(){

	if(gon.edit_dec_form){
		// load the date pickers
		$("input[id*='_complaint_district_registration_time']").live('click', function() {
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

		$("input[id*='_complaint_disscusion_time']").live('click', function() {
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

$(function(){

	if(gon.edit_dec_form){
		// load the date pickers
		$("input[id*='_complaint_district_registration_time']").live('click', function() {
	    $(this).datetimepicker('destroy').datetimepicker({
				showOn:'focus',
				dateFormat: 'dd.mm.yy',
				timeFormat: 'hh:mm',
				separator: ' '
			}).focus();
    });

		$("input[id*='_complaint_disscusion_time']").live('click', function() {
	    $(this).datetimepicker('destroy').datetimepicker({
				showOn:'focus',
				dateFormat: 'dd.mm.yy',
				timeFormat: 'hh:mm',
				separator: ' '
			}).focus();
    });
  }

});

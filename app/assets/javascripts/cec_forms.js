$(function(){

	if(gon.edit_cec_form){
		// load the date pickers
		$("input[id*='_cesko_complaint_registration_time']").live('click', function() {
	    $(this).datetimepicker('destroy').datetimepicker({
				showOn:'focus',
				dateFormat: 'dd.mm.yy',
				timeFormat: 'hh:mm',
				separator: ' '
			}).focus();
    });

		$("input[id*='_cesko_complaint_discation_time']").live('click', function() {
	    $(this).datetimepicker('destroy').datetimepicker({
				showOn:'focus',
				dateFormat: 'dd.mm.yy',
				timeFormat: 'hh:mm',
				separator: ' '
			}).focus();
    });
  }

});

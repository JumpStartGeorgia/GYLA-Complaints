var urlParams = {};
(function () {
    var match,
        pl     = /\+/g,  // Regex for replacing addition symbol with a space
        search = /([^&=]+)=?([^&]*)/g,
        decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); },
        query  = window.location.search.substring(1);

    while (match = search.exec(query))
       urlParams[decode(match[1])] = decode(match[2]);
})();

function file_attachment_remove_handler ()
{
  var parent = $(this).closest('.file_field');
  parent.slideUp(function ()
  {
    parent.remove();
  });
}

function file_attachment_remove_perm_handler ()
{
  if (!confirm('დარწმუნებული ხართ?'))
  {
    return false;
  }

  var parent = $(this).closest('.file_field');
  $.getJSON('/unlink/' + $(this).data('id'), function (status)
  {
    if (status)
    {
      parent.slideUp(function ()
      {
        parent.remove();
      });
    }
    else
    {
      console.log('error removing file');
    }
  });
}

$(function ()
{

  var uniqi = $('input[name*="complaint[complaint_files_attributes]"][type="file"]').last().data('uniqi');


  $('.file_attachment_remove:not(.perm)').click(file_attachment_remove_handler);
  $('.file_attachment_remove.perm').click(file_attachment_remove_perm_handler);

  $('.file_attachment_add').click(function ()
  {
    uniqi ++;

    var type = $(this).data('type');
    if (type != 'general')
    {
      hiddenval = '<input type="hidden" value="' + $(this).data('additionalid') + '" name="complaint[complaint_files_attributes][new_' + uniqi + '][additional_info_id]" />';
    }
    else
    {
      hiddenval = '';
    }

    var last = $(this)
        .closest('.file_attachments')
        .find('.file_fields')
        .append('<div class=\'file_field control-group hidden\'><div class=\'controls span5\'><input type=\'hidden\' value=\'' + type + '\' name=\'complaint[complaint_files_attributes][new_' + uniqi + '][attachment_type]\' />' + hiddenval + '<input class=\'text_field left\' name=\'complaint[complaint_files_attributes][new_' + uniqi + '][file]\' type=\'file\'> <a href=\'javascript:;\' class=\'file_attachment_remove right\'>ფაილის წაშლა</a></div></div>')
        .children()
        .last();

    last.hide().removeClass('hidden').slideDown().find('.file_attachment_remove').click(file_attachment_remove_handler);
  });




  $('#complaint_level').change(function ()
  {
    var c = $('.after_level_select'),
    val = $(this).val();

    if (val.length > 0)
    {
			// set level value in hidden form
			$("input[id*='_level']").val($(this).val());

			// show/hide fields
      if (val == 'court')
      {
        c.find('.court').removeClass('hidden');
      }
      else
      {
        c.find('.court').addClass('hidden');
      }
      c.slideDown('slow');
    }
    else
    {
      c.slideUp('slow');
    }
  });


	if(gon.edit_complaint){
		// if moving to next level, set focus on level drop down
		if (urlParams["next_level"] === "true"){
			$("select[id*='_level']:last")[0].focus();
			// set this var so the default focusing to first form field does not override
			gon.alread_set_focus = true;
		}

		// load the date pickers
		// violation_time
		$('#complaint_violation_time').datetimepicker({
				dateFormat: 'yy-mm-dd',
				timeFormat: 'hh:mm',
				separator: ' '
		});
		if (gon.violation_time !== undefined &&
				gon.violation_time.length > 0)
		{
			$('#complaint_violation_time').datepicker("setDate", new Date(gon.violation_time));
		}

		// complaint_writing_time
		$("input[id*='_complaint_writing_time']").live('click', function() {
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


		// response_date
		$("input[id*='_response_date']").live('click', function() {
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

  }


});

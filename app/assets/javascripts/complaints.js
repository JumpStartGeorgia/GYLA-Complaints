
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
    var type = $(this).data('type');
    if (type == 'observer')
    {
    }
    else if (type == 'other')
    {
    }

    uniqi ++;

    var last = $(this)
        .closest('.file_attachments')
        .find('.file_fields')
        .append('<div class=\'file_field control-group hidden\'><div class=\'controls\'><input type=\'hidden\' value=\'observer\' name=\'complaint[complaint_files_attributes][new_' + uniqi + '][' + type + ']\' /><input class=\'text_field\' name=\'complaint[complaint_files_attributes][new_' + uniqi + '][file]\' type=\'file\'> <a href=\'javascript:;\' class=\'file_attachment_remove\'>ფაილის წაშლა</a></div></div>')
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
		// load the date pickers
		// violation_time
		$('#complaint_violation_time').datetimepicker({
				dateFormat: 'dd.mm.yy',
				timeFormat: 'hh:mm',
				separator: ' '
		});
		if (gon.violation_time !== undefined &&
				gon.violation_time.length > 0)
		{
			$('#complaint_violation_time').datepicker("setDate", new Date(gon.violation_time));
		}

		// complaint_writing_time
		$('#complaint_complaint_writing_time').datetimepicker({
				dateFormat: 'dd.mm.yy',
				timeFormat: 'hh:mm',
				separator: ' '
		});
		if (gon.complaint_writing_time !== undefined &&
				gon.complaint_writing_time.length > 0)
		{
			$('#complaint_complaint_writing_time').datepicker("setDate", new Date(gon.complaint_writing_time));
		}

		// response_date
		$('#complaint_response_date').datetimepicker({
				dateFormat: 'dd.mm.yy',
				timeFormat: 'hh:mm',
				separator: ' '
		});
		if (gon.response_date !== undefined &&
				gon.response_date.length > 0)
		{
			$('#complaint_response_date').datepicker("setDate", new Date(gon.response_date));
		}

  }


});

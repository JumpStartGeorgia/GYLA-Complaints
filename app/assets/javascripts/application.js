// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require i18n
//= require i18n/translations
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require twitter/bootstrap
//= require jquery_nested_form
//= require vendor
//= require_tree .

// set focus to first text box on page
$(document).ready(function(){
	if (gon.highlight_first_form_field){
	  $(":input:visible:enabled:first").focus();
	}
});

$(function(){
   $('#pec-index-table tbody, #dec-form-table tbody, #cec-form-table tbody').find('tr').each(function(index, value){
      $(value).click(function(){
         window.location = window.location.href+'/'+ids[index];
      });
   });
});


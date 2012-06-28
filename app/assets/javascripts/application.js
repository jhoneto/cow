// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require jquery_nested_form
//= require autocomplete-rails
//= require jquery.contextMenu
//= require jquery.ui.position
//= require jquery.maskedinput
//= require jquery.maskMoney
//= require bootstrap
//= require fullcalendar

function convert_to_money(value){
	var v = value;
	v = v.replace(",", "");
	v = v.replace(".", ",");
	decimal  = v.substring(v.indexOf(",")+1);
	if (decimal.length < 2) {
		v = v + '0';
	}                  
	if (decimal.length == v.length) {
		v = v + '00';
	}
	return v;
	
}

function convert_to_float(value){
	value = value.replace(".", "");
	value = value.replace(",", ".");
	return parseFloat(value);
}

function multiply_money(value1, value2){
	value1 = value1.replace(".", "");
	value1 = value1.replace(",",".");
	value2 = value2.replace(".", "");
	value2 = value2.replace(",",".");
	return value1*value2;
}


$(function(){


	$(".datepicker").datepicker({
		dateFormat: 'dd/mm/yy',
		dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado','Domingo'],
		dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
		dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
		monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
		nextText: 'Próximo',
		prevText: 'Anterior'
	});
	
	$(".valor_monetario").maskMoney({
         thousands: '.',
	     decimal: ',',
	     precision: 2
     });   
    $(".valor_monetario").msk();
});

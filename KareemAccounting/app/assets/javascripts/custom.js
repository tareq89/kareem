function makeTrHiddenOnRadioSelect (argument) {
	$("tbody tr").css({"display":""});
	var total_amount = 0;

	$("tbody tr").each(function() {
		if (argument.id != this.className) 
			$(this).css({'display':'none'});		
		else
			// console.log($(this).find(".amount").context.cells[1].innerHTML);		
			total_amount += parseInt($(this).find(".amount").context.cells[1].innerHTML);
	});		
	if (argument.id == "all") {
		$("tbody tr").css({"display":""});
		
		$("tbody tr").each(function() {
			total_amount += parseInt($(this).find(".amount").context.cells[1].innerHTML);
		})	
	};
	document.getElementById('total_amount').innerHTML = total_amount;
	console.log(total_amount);
}
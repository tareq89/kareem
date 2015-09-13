function makeTrHiddenOnRadioSelect (argument) {
	$("tbody tr").css({"display":""});
	var total_amount = 0;

	$("tbody tr").each(function() {
		if (argument.id == "all") {
			$("tbody tr").css({"display":""});
			total_amount += parseInt($(this).find(".amount").context.cells[1].innerHTML);									
		}
		else if (argument.id != this.className){
			$(this).css({'display':'none'});
		};
		if (argument.id == this.className) {
			total_amount += parseInt($(this).find("#amount").context.cells[1].innerHTML);								
		};				 
	});		

	document.getElementById('total_amount').innerHTML = "	Total : "+total_amount+" ৳";
	console.log(total_amount);
}
function makeTrHiddenOnRadioSelect (argument) {
	$("tbody tr").css({"display":""});
	var total_amount = 0;

	$("tbody tr").each(function() {

		try{
			var account_type = this.className.split(" ")[0];
			var is_debit = JSON.parse(this.className.split(" ")[1]);
			console.log("className 		: "+this.className)
			console.log("account_type 	: "+account_type)
			console.log("is_debit 		: "+is_debit)
		} catch(err) {
			console.log(err.message + "  " + this.className)
		};


		if (argument.id == "all") {
			$("tbody tr").css({"display":""});
			// total_amount += parseInt($(this).find(".amount").context.cells[1].innerHTML);								
			if (is_debit) {
				total_amount -= parseInt($(this).find(".amount").context.cells[1].innerHTML);
			} else{
				total_amount += parseInt($(this).find(".amount").context.cells[1].innerHTML);
			}	
		}
		else if (argument.id != account_type){
			$(this).css({'display':'none'});
		};
		if (argument.id == account_type) {
			// total_amount += parseInt($(this).find("#amount").context.cells[1].innerHTML);
			if (is_debit) {
				total_amount -= parseInt($(this).find(".amount").context.cells[1].innerHTML);
			} else{
				total_amount += parseInt($(this).find(".amount").context.cells[1].innerHTML);
			}
		};				 
	});		

	document.getElementById('total_amount').innerHTML = "	Total : "+total_amount+" ৳";
	console.log("total_amount 		:" + total_amount);
	console.log("\n\n\n")
}
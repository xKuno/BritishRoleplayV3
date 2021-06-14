function closeMainQU() {
	$("body").css("display", "none");
}
function openCarryMenuQU() {
	$("body").css("display", "block");
}

$(".closetypemenu").click(function(){
    $.post('http://brp2/closetypeselect', JSON.stringify({}));
});

window.addEventListener('message', function (event) {

	var item = event.data;
	
	if (item.message == "showcarryrequestreceiever") {
		$('#carryrequester').hide();
		$('#carryed').hide();
		$('#carrytype').hide();
		$('#carryreceiever').show();
		openCarryMenuQU();
	}	
	
	if (item.message == "showcarryrequestrequester") {
		$('#carryreceiever').hide();
		$('#carryed').hide();
		$('#carrytype').hide();
		$('#carryrequester').show();
		document.getElementById("secondsremainingrequest").innerHTML = item.remainingseconds;
		openCarryMenuQU();
	}		
	
	if (item.message == "showcarryed") {
		$('#carryreceiever').hide();
		$('#carryrequester').hide();
		$('#carrytype').hide();
		$('#carryed').show();
		openCarryMenuQU();
	}	

	if (item.message == "showtypes") {
		$('#carryreceiever').hide();
		$('#carryrequester').hide();
		$('#carryed').hide();
		$('#carrytype').show();
		openCarryMenuQU();
	}			
	
	if (item.message == "hide") {
		closeMainQU();
		$('#carryreceiever').hide();
		$('#carryrequester').hide();
		$('#carrytype').hide();
		$('#carryed').hide();
	}
});

$(".carry1select").click(function () {
	closeMainQU();
	$('#carryreceiever').hide();
	$('#carryrequester').hide();
	$('#carryed').hide();
	$('#carrytype').hide();
	$.post('http://brp2/selecttype', JSON.stringify({
		carrytype: "type1"
	}));
});

$(".carry2select").click(function () {
	closeMainQU();
	$('#carryreceiever').hide();
	$('#carryrequester').hide();
	$('#carryed').hide();
	$('#carrytype').hide();
	$.post('http://brp2/selecttype', JSON.stringify({
		carrytype: "type2"
	}));
});

$(".carry3select").click(function () {
	closeMainQU();
	$('#carryreceiever').hide();
	$('#carryrequester').hide();
	$('#carryed').hide();
	$('#carrytype').hide();
	$.post('http://brp2/selecttype', JSON.stringify({
		carrytype: "type3"
	}));
});
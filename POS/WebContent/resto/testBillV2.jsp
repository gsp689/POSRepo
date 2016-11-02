<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Billing Console</title>
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
	$('#tableNumber').focusout(function(event) {
		var tableNumber = $('#tableNumber').val();
		$.getJSON('ajaxAction', {
			tableNumber : tableNumber
	      }, function(jsonResponse) {
	        $('#ajaxResponse').text(jsonResponse.dummyMsg);
	        var select = $('#states');
	        select.find('option').remove();
	        $.each(jsonResponse.stateMap, function(key, value) {
	          $('<option>').val(key).text(value).appendTo(select);
	        });
	      });
	});//tableNumber
	
	
	
	
});
</script>
</head>
<body>
	<input type="text" class="code" id="tableNumber" value="" placeholder="Table"  />&nbsp;
	<input type="text" class="code" id="itemCode" value="" placeholder="Item"/> &nbsp;
	<input type="text" class="addCF" id="quantity" value=""	placeholder="Quantity"/> &nbsp;
	<input type="button" value="print">
	<hr>
	<table id="myTable" style="display:none" class="myTable">
        <th>Sr.No</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Action</th>
        
      
</table>
	
	
	
	
	<!-- <tr><td><input id="txtTable1" value="1"></td><td><input id="txtItemName1" value="1"></td><td><input id="txtQuantity1" value="2"></td><td><input id="txtPrice1"></td><td><button id="txtOccupation1" class="remCF" onclick="deleteRow(this)">X</button></td></tr> -->
</body>
</html>
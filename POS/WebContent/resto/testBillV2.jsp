<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Billing Console</title>
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function() {
	$('#tableNumber').focusout(function(event) {
		var tableNumber = $('#tableNumber').val();
		$.getJSON('ajaxAction', {
			tableNumber : tableNumber
	      }, function(jsonResponse) {
	        $('#ajaxResponse').text(jsonResponse.dummyMsg);
	        var tableData = jsonResponse.tableData;
	       alert(tableData);
	    var tableObject = $.parseJSON(tableData); //Only if not already an object
	    //alert(jsonObject);
	   
	    $.each(tableObject.orders, function (i, ordersObject) {
	    	var orderTotal= 0;
	    	 $('<tr>').html(
		    	        "<td>orders"+i+"</td>").appendTo('#myTable');
	        $.each(ordersObject.orderItems, function (i, orderItemsObject) {
	        	orderTotal = orderTotal + orderItemsObject.itemPrice;
		       // alert(orderItemsObject.quantity);
		        $('<tr>').html(
		    	        "<td>" + i + "</td><td>" + orderItemsObject.itemName + "</td><td>" + orderItemsObject.quantity + "</td><td>" + orderItemsObject.itemPrice + "</td><td><input class='del' type='button' value='Delete'/></td>").appendTo('#myTable');
		       
		    });
	        $('<tr>').html(
	    	        "<td></td><td></td><td>Total</td><td>" + orderTotal + "</td><td><input class='print' type='button' value='Print'/></td>").appendTo('#myTable');
	    });

	      });
	});//tableNumber
	
	$("#myTable").on('click', '.del', function(){
		$(this).closest('tr').remove();
		});//removeButton
	
	$('#quantity').keypress(function(event) {
		if(event.which == 13) {
		alert("record added and displayed");
		var tableNumber = $('#tableNumber').val();
		$.getJSON('ajaxAction', {
			tableNumber : tableNumber
	      }, function(jsonResponse) {
	        $('#ajaxResponse').text(jsonResponse.dummyMsg);
	        var tableData = jsonResponse.tableData;
	       alert(tableData);
	       $.each(tableData.orders, function(i, item) {
	    	   $.each(tableData.orders[i].orderItems, function(j, orderItem) {
	    	    $('<tr>').html(
	    	        "<td>" + i + "</td><td>" + orderItem[0].itemName + "</td><td>" + orderItem[0].quantity + "</td><td>" + orderItem[0].itemPrice + "</td>").appendTo('#myTable');
	    	   })
	    	})
	      });
		}
	});//quantity
	 var availableItems = [
	        		      "tea",
	        		      "coffee",
	        		      "vmr",
	        		      "cmr"
	        		      
	        		    ];
	  $( function() {
		   
		    $( "#itemCode" ).autocomplete({
		      source: availableItems
		    });
		  } );//autocompleteItemBox
	
	
});
</script>
</head>
<body>
	<input type="text" class="tableNumber" id="tableNumber" value="" placeholder="Table"  />&nbsp;
	<input type="text" class="code" id="itemCode" value="" placeholder="Item"/> &nbsp;
	<input type="text" class="quantity" id="quantity" value=""	placeholder="Quantity"/> &nbsp;
	<input type="button" value="print">
	<hr>
	<table id="myTable"  class="myTable" border="1" align="center" cellspacing="">
        <th>Sr.No</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Action</th>
        
      
</table>
	
	
	
	
	<!-- <tr><td><input id="txtTable1" value="1"></td><td><input id="txtItemName1" value="1"></td><td><input id="txtQuantity1" value="2"></td><td><input id="txtPrice1"></td><td><button id="txtOccupation1" class="remCF" onclick="deleteRow(this)">X</button></td></tr> -->
</body>
</html>
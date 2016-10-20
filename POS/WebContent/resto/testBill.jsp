<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script>
$(document).ready(function(){
	
     
	
	var index = 1;
	$(".addCF").click(function(){
		insertRow();
		
	});
	
	 $("#"+document.getElementById("tableNumber").value).on('click','.remCF',function(){
	        $(this).parent().parent().remove();
	    });
});



function deleteRow(r) {
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById(document.getElementById("tableNumber")).deleteRow(i);
   
    arrangeSno();
}

function arrangeSno()

{
	
    var tblObj = document.getElementById(document.getElementById("tableNumber"));

    var no_of_rows = tblObj.rows.length;

    for(var i=0; i<no_of_rows-1; i++){
		var x = i+1;
        var inner = "<input id=\"txtTable"+x+"\" value=\""+x+"\">";
    	/* alert(inner); */
 		tblObj.rows[i+1].cells[0].innerHTML = inner;
    }

}
function getAllTables(){
	return document.getElementsByClassName("myTable");
}

function hideAllTables(){
	
}

function displayTable(){
	var allTables = getAllTables();
	alert(allTables.length);
	for (i = 0; i < allTables.length; i++) {
		allTables[i].style.display = "none";
	}
	//t5.setAttribute("onclick","deleteRow(this)");style="display:none"
	document.getElementById(document.getElementById("tableNumber").value).setAttribute("style","display:table");
}

function itemCodeExist(){
	 var tblObj = document.getElementById(document.getElementById("tableNumber").value);
	 var itemCode = document.getElementById("itemCode").value;
	 var itemQuantity = document.getElementById("quantity").value;
	    var no_of_rows = tblObj.rows.length;
	    //alert(itemCode);
	    for(var i=0; i<no_of_rows-1; i++){
	    	var inner = tblObj.rows[i+1].cells[1].firstChild.value;
	    	
	    	 var stringToTest = "value=\""+itemCode+"";
	    	 if (inner == itemCode) {
	    		 tblObj.rows[i+1].cells[2].firstChild.value = parseInt(itemQuantity) + parseInt(tblObj.rows[i+1].cells[2].firstChild.value);
	    		 return true;
	    		 
	    		}
	    	//inner.includes(stringToTest);
		
	    }
	    return false;
}
function insertRow(e,textArea){
	
			var code = (e.keyCode ? e.keyCode : e.which);
			if(code == 13) { //Enter keycode
				var recordExist = itemCodeExist();
			if(recordExist){
				alert("Exist");
			}
			else{
				var tableNumber = document.getElementById("tableNumber").value;
				var itemCode = document.getElementById("itemCode").value;
				var quantity = document.getElementById("quantity").value;
				
	            var table=document.getElementById(document.getElementById("tableNumber").value);
	            index = table.rows.length;
	            var row=table.insertRow(table.rows.length);
	            var cell1=row.insertCell(0);
	            var t1=document.createElement("input");
	                t1.id = "txtTable"+index;
	                t1.setAttribute("value",index);
	                
	                cell1.appendChild(t1);
	                
	            var cell2=row.insertCell(1);
	            var t2=document.createElement("input");
	                t2.id = "txtItemName"+index;
	                t2.setAttribute("value",itemCode);
	                cell2.appendChild(t2);
	                
	            var cell3=row.insertCell(2);
	            var t3=document.createElement("input");
	                t3.id = "txtQuantity"+index;
	                t3.setAttribute("value",quantity);
	                cell3.appendChild(t3);
	                
	            var cell4=row.insertCell(3);
	            var t4=document.createElement("input");
	                t4.id = "txtPrice"+index;
	                cell4.appendChild(t4);
	                
	            var cell5=row.insertCell(4);
	            var t5=document.createElement("button");
	                t5.id = "txtOccupation"+index;
	                var t = document.createTextNode("X");       // Create a text node
	                t5.appendChild(t); 
	                t5.className = "remCF";
	                t5.setAttribute("onclick","deleteRow(this)");
	                cell5.appendChild(t5);
	      		index++;
			}
			}
			/* var tbl= document.getElementById(document.getElementById("tableNumber").value);
			alert("god is great");
			alert(tbl.innerHTML); */
			saveSettings();

}

function tableNumberPressed(e,textArea){
	if (e.which == 13) {
		alert(document.getElementById("tableNumber").value);
		displayTable();
	}
}

function itemCodePressed(e,textArea){
	if (e.which == 13) {
		
		alert(document.getElementById("itemCode").value);
	}
}


function loadSettings() {
	alert("hiii");
	alert("loading");
	document.getElementById("1").innerHTML = localStorage.getItem(t1); 
	document.getElementById("2").innerHTML = localStorage.getItem(t2); 
}

function saveSettings() {
	alert("saving");
    var t1 = document.getElementById("1").innerHTML;
    var t2 = document.getElementById("2").innerHTML;

    localStorage.setItem("t1", t1);
    localStorage.setItem("t2", t2);
}

</script>
</head>
<body onload="loadSettings()">


<input type="text" class="code" id="tableNumber"  value="" placeholder="Table"  onkeypress="tableNumberPressed(event, this)"/> &nbsp;
<input type="text" class="code" id="itemCode"  value="" placeholder="Item"  onkeypress="itemCodePressed(event, this)"/> &nbsp;
<input type="text" class="addCF" id="quantity"  value="" placeholder="Quantity" onkeypress="insertRow(event, this)" /> &nbsp;
<hr>

<table id="1" style="display:none" class="myTable">
        <th>Sr.No</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Action</th>
        
      
</table>


<table id="2" style="display:none" class="myTable">
        <th>Sr.No1</th>
        <th>Item1</th>
        <th>Quantity1</th>
        <th>Price1</th>
        <th>Action1</th>
        
        
</table>
</body>
</html>
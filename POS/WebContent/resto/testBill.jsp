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
	
	 $("#myTable").on('click','.remCF',function(){
	        $(this).parent().parent().remove();
	    });
});


function deleteRow(r) {
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(i);
   
    arrangeSno();
}




function arrangeSno()

{
	
    var tblObj = document.getElementById("myTable");

    var no_of_rows = tblObj.rows.length;

    for(var i=0; i<no_of_rows-1; i++){
		var x = i+1;
        var inner = "<input id=\"txtTable"+x+"\" value=\""+x+"\">";
    	alert(inner);
 		tblObj.rows[i+1].cells[0].innerHTML = inner;
    }

}
function insertRow(e,textArea){
			
			var code = (e.keyCode ? e.keyCode : e.which);
			if(code == 13) { //Enter keycode
				var tableNumber = document.getElementById("tableNumber").value;
				var itemCode = document.getElementById("itemCode").value;
				var quantity = document.getElementById("quantity").value;
				
	            var table=document.getElementById("myTable");
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

</script>
</head>
<body>
<input type="text" class="code" id="tableNumber"  value="" placeholder="Table"  /> &nbsp;
<input type="text" class="code" id="itemCode"  value="" placeholder="Item"  /> &nbsp;
<input type="text" class="addCF" id="quantity"  value="" placeholder="Input Value" onkeypress="insertRow(event, this)" /> &nbsp;
<hr>

<table id="myTable">
        <th>Sr.No</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Action</th>
        
        <!-- <tr>
            <td><input type="text" id="txtName" /></td>
            <td><input type="text" id="txtAge" /></td>
            <td><input type="text" id="txtGender" /></td>
            <td><input type="text" id="txtOccupation" /></td>
            <td><input type="button" id="btnAdd" class="button-add" onClick="insertRow()" value="add"></input></td>
        </tr> -->
</table>
</body>
</html>
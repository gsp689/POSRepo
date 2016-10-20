<!DOCTYPE html>
<html>
<head>
<title>jQuery jTable Setup in java</title>
<!-- jTable Metro styles. -->
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"
	type="text/css" />

<!-- jTable script file. -->
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#StudentTableContainer').jtable({
			title : 'Students List',
			actions : {
				listAction : 'listAction',
				updateAction : 'updateAction',
				deleteAction : 'deleteAction',
				createAction : 'createAction'
			},
			fields : {
				studentId : {
					title : 'Student Id',
					width : '30%',
					key : true,
					list : true,
					create : true
				},
				name : {
					title : 'Name',
					width : '30%',
					edit : false
				},
				department : {
					title : 'Department',
					width : '30%',
					edit : true
				},
				emailId : {
					title : 'Email',
					width : '20%',
					edit : true
				}
			}
		});
		 $('#StudentTableContainer').jtable('load');
        $('#LoadRecordsButton').click(function (e) {
            e.preventDefault();
            $('#StudentTableContainer').jtable('load', {
                name: $('#name').val()
                
            });
        });
 
        //Load all records when page is first shown
       
	});
</script>
</head>
<div class="filtering">
    <form>
        Name: <input type="text" name="name" id="name" />
        <button type="submit" id="LoadRecordsButton">Load records</button>
        </form>
        </div>
        
<div style="text-align: center;">
        <h4>jQuery jTable Setup in java</h4>
        <div id="StudentTableContainer"></div>
</div>
</html>
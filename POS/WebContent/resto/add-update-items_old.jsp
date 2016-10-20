<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>jqGrid - Ace Admin</title>

		<meta name="description" content="Dynamic tables and grids using jqGrid plugin" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->
		<!-- <link rel="stylesheet" href="assets/css/jquery-ui.min.css" /> -->
		<link rel="stylesheet" href="assets/css/bootstrap-datepicker3.min.css" />
		<!-- <link rel="stylesheet" href="assets/css/ui.jqgrid.min.css" /> -->

		<!-- text fonts -->
		<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="assets/js/ace-extra.min.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
		
		<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
		<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />

		<!-- jTable script file. -->
		<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
		<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
		<script src="js/jquery.jtable.js" type="text/javascript"></script>
	</head>

	<body class="no-skin">
		<jsp:include page="navbar.jsp"></jsp:include>
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>

			<jsp:include page="sidebar.jsp"></jsp:include>

			<div class="main-content">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Home</a>
							</li>

							<li>
								<a href="#">Add or Update Items</a>
							</li>
							<li class="active">Inventory Items</li>
						</ul><!-- /.breadcrumb -->
					</div>

					<div class="page-content">
						<jsp:include page="setting-panel.jsp"></jsp:include>

						<div class="page-header">
							<h1>
								Inventory Items
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									Please Add or Update items carefully
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="alert alert-info">
									<button class="close" data-dismiss="alert">
										<i class="ace-icon fa fa-times"></i>
									</button>

									<i class="ace-icon fa fa-hand-o-right"></i>
									Please note that demo server is not configured to save the changes, therefore you may see an error message.
								</div>

								<!-- <table id="grid-table"></table> -->
							<div class="filtering">
								<form>
									Name: <input type="text" name="name" id="name" />
									<button type="submit" id="LoadRecordsButton">Load
										records</button>
								</form>
							</div>

							<div style="text-align: center;">
								<h4>jQuery jTable Setup in java</h4>
								<div id="StudentTableContainer"></div>
							</div>

							<div id="grid-pager"></div>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">Ace</span>
							Application &copy; 2013-2014
						</span>

						&nbsp; &nbsp;
						<span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
					</div>
				</div>
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
			
			
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<!-- <script src="assets/js/jquery-2.1.4.min.js"></script> -->

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="assets/js/bootstrap-datepicker.min.js"></script>

		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
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
	</body>
</html>

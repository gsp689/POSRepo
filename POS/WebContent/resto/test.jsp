<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
 <head>
<title>AJAX in Struts 2 using JSON and jQuery</title>
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
   $('#country').change(function(event) {
      var country = $("select#country").val();
      $.getJSON('ajaxAction', {
        countryName : country
      }, function(jsonResponse) {
        $('#ajaxResponse').text(jsonResponse.dummyMsg);
        var select = $('#states');
        select.find('option').remove();
        $.each(jsonResponse.stateMap, function(key, value) {
          $('<option>').val(key).text(value).appendTo(select);
        });
      });
      });
});
</script>
</head>
<body>
   <h3>AJAX calls to Struts 2 using JSON and jQuery</h3>
   <s:select id="country" name="country"
        list="{'Select Country','India','US'}" label="Select Country" />
   <br />
   <br />
   <s:select id="states" name="states" list="{'Select State'}"
        label="Select State" />
   <br />
   <br />
   <div id="ajaxResponse"></div>
</body>

</html>
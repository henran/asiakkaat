<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<table id="lista">
<thead>
<tr>
<th id="haku">Hakusana:</th>
<th><input type="text" id="hakusana"></th>
<th><input type="button" value="Hae" id="hakunappi"></th>
</tr>
<tr>

<th id="haku">Etunimi</th>
<th id="haku">Sukunimi</th>
<th id="haku">Puhelin</th>
<th id="haku">Sposti</th>
</tr>
</thead>
<tbody>
</tbody>
</table>
<script>
$(document).ready(function()) {
	/*haeAsiakkaat();
	$("#hakunappi").click(function(){
		haeAsiakkaat();
	});
	$(document.body).on("keydown", function(event){
		if(event.which==13){
			haeAsiakkaat();
		}
	});
	$("#hakusana").focus();
});
function haeAsiakkaat(){
	$("#lista tbody").empty();
}
*/
	$.ajax({url:"asiakkaat", type="GET", dataType:"json", success:function(result){
		$.each(result.asiakkaat, function(i, field){
		var htmlStr;	
		 htmlStr +="<tr>";

		 htmlStr +="<td>"+field.etunimi+"</td>";
		 htmlStr +="<td>"+field.sukunimi+"</td>";
		 htmlStr +="<td>"+field.puhelin+"</td>";
		 htmlStr +="<td>"+field.sposti+"</td>";
		 htmlStr +="</tr>";
		 $("#lista tbody").append(htmlStr);
		});
	}});
	}
</script>
</body>
</html>